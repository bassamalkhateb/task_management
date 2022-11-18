import 'package:get/get.dart';
import 'package:task_management/Screen/add_task.dart';
import 'package:task_management/Screen/all_task_screen.dart';
import 'package:task_management/Screen/edit_screen.dart';
import 'package:task_management/Screen/home_screen.dart';

import '../Screen/view_task.dart';

class RoutesClass {
  static String home ="/";
  static String allTask ="/allTask";
  static String addTask ="/addTask";
  static String editTask ="/editTask";
  static String viewTask ="/viewTask";



  static String getHomeRoute()=>home;
  static String getAllTakRoute()=>allTask;
  static String getAddTakRoute()=>addTask;
  static String getEditTakRoute(String id )=>'$editTask?id=$id';
  static String getViewTakRoute(String id )=>'$viewTask?id=$id';

  static List<GetPage> routes =[
      GetPage(name: home, page: ()=>const HomeScreen()),
    GetPage(name: allTask, page: ()=>const AllTaskScreen(),transition: Transition.fade,transitionDuration: Duration(seconds: 2)),
    GetPage(name: addTask, page: ()=>const AddTask(),transition: Transition.zoom,transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: editTask, page: (){
      var id = Get.parameters['id'];
      return EditScreen(id: int.parse(id!));
    },transition: Transition.zoom,transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: viewTask, page: (){
      var id = Get.parameters['id'];
      return ViewTask(id: int.parse(id!));
    },transition: Transition.zoom,transitionDuration: Duration(milliseconds: 500)),


  ];
}