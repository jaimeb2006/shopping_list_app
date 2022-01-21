import 'package:get/get.dart';

Future<String> llamadaApi() async {
  await Future.delayed(const Duration(seconds: 3));
  return "Datos recibidos";
}

class ApiRequestController extends GetxController with StateMixin {
  //TODO: Implement ApiRequestController

  ApiRequestController() {
    change("", status: RxStatus.empty());
  }

  void consultar(conError) async {
    try {
      change(null, status: RxStatus.loading());
      String resp = await llamadaApi();
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
