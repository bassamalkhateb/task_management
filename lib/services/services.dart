import 'package:get/get.dart';

class DataServicce extends GetConnect implements GetxService {
  Future<Response> getData() async {
    Response response = await get("http://127.0.0.1:8082/gettasks",
        headers: {'Content=Type': 'application/json; charset=UTF-8'});
    return response;
  }
}
