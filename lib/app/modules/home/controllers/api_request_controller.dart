import 'package:get/get.dart';
import 'package:shopping_list/app/data/model/user_model.dart';
import 'package:shopping_list/app/data/provider/authentication_api.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';

class ApiRequestController extends GetxController with StateMixin {
  //TODO: Implement ApiRequestController
  // final AuthenticationRepository authProvider;

  ApiRequestController() {
    change("", status: RxStatus.empty());
  }

  void consultar(conError) async {
    try {
      change(null, status: RxStatus.loading());
      // UserModel resp = await authProvider.newRegisterUser();
      if (conError) {
        change(null, status: RxStatus.error('Error en la identificacion'));
      } else {
        change('resp', status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
