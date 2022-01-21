import 'package:get/get.dart';
import 'package:shopping_list/app/data/auth_provider.dart';

class ApiRequestController extends GetxController with StateMixin {
  //TODO: Implement ApiRequestController
  final AuthProvider authProvider;

  ApiRequestController(this.authProvider) {
    change("", status: RxStatus.empty());
  }

  void consultar(conError) async {
    try {
      change(null, status: RxStatus.loading());
      String resp = await authProvider.llamadaApi();
      if (conError) {
        change(null, status: RxStatus.error('Error en la identificacion'));
      } else {
        change(resp, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
