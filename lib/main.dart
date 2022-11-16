import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/Screen/add_task.dart';
import 'package:task_management/Screen/all_task_screen.dart';
import 'package:task_management/controller/data_Controller.dart';
import 'package:task_management/Screen/home_screen.dart';
import 'package:task_management/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  loadData() async{
    await Get.find<DataController>().getData();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesClass.getHomeRoute(),
      getPages: RoutesClass.routes ,
    );
  }
}
