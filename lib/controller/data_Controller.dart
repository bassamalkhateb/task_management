import 'package:get/get.dart';
import 'package:task_management/services/services.dart';

class DataController extends GetxController {
  DataServicce service = DataServicce();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];

  List<dynamic> get myData =>_myData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();

    if (response.statusCode == 200) {
      _myData = response.body;
      print("basssssssssssam 1");
      update();
    } else {
      print("basssssssssssam 2");
    }
    print(_myData);
  }
}
