import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_management/services/services.dart';
import 'package:task_management/utiles/app_constants.dart';

class DataController extends GetxController {
  DataServicce service = DataServicce();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];

  List<dynamic> get myData =>_myData;
  Map<String, dynamic>_singleData={};
  Map<String, dynamic> get singleData=> _singleData ;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_URL);

    if (response.statusCode == 200) {
      _myData = response.body;
      print("basssssssssssam 1");

    } else {
      print("basssssssssssam 2");
    }
    _isLoading = false;
    update();
  }
  Future<void> getSingelData(String id ) async {
    _isLoading = true;
    Response response = await service.getData("${AppConstants.GET_TASK}"'?id=$id');

    if (response.statusCode == 200) {
      // _myData = response.body;
      if(kDebugMode){
        print("basssssssssssam new task");
        _singleData=response.body;
      }

    } else {
      print("basssssssssssam error new task");
    }
    _isLoading = false;
    update();
  }
  Future<void> postData(String task , String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.CREATE_URL,{
      "task_name":task,
      "task_detail": taskDetail
    });


    if (response.statusCode == 200) {
      // _myData = response.body;
      print("basssssssssssam Post");
      update();
    } else {
      print("basssssssssssam ");
    }
    update();
  }
  Future<void> updateData(String task , String taskDetail, int  id) async {
    _isLoading = true;
    Response response = await service.updateData("${AppConstants.UPDATE_TASK}"'?id=$id',{
      "task_name":task,
      "task_detail": taskDetail
    });


    if (response.statusCode == 200) {
      // _myData = response.body;
      print("basssssssssssam Post");
      update();
    } else {
      print("basssssssssssam ");
    }
    update();
  }
  Future<void> deleteData(int id) async {
    _isLoading = true;
    update();
    Response response = await service.deleteData("${AppConstants.DELETE_TASK}"'?id=$id');
    if (response.statusCode == 200) {
      print("basssssssssssam Post");
      update();
    }else{
      print("basssssssssssam ");
    }
    Future.delayed(Duration(seconds: 1),
            (){
          _isLoading=false;
          update();
       }

    );

  }
}
