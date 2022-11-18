

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controller/data_Controller.dart';

import '../utiles/colors.dart';
import '../widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id ;

   ViewTask({Key? key, required this.id}) : super(key: key);
   _loadSingleDayd()async{
     await Get.find<DataController>().getSingelData(id.toString());
   }
   @override
  Widget build(BuildContext context) {
     _loadSingleDayd();
     TextEditingController nameController = TextEditingController();
     TextEditingController detailController = TextEditingController();
     return Scaffold(
       body: GetBuilder<DataController>(builder: ((controller) {
         nameController.text=controller.singleData["task_name"]??"Task name not found";
         detailController.text=controller.singleData["task_detail"]??"Task detail  not found";
         return Container(
           width: double.maxFinite,
           height: double.maxFinite,
           padding: const EdgeInsets.only(left: 10, right: 20),
           decoration: BoxDecoration(
             image: DecorationImage(
               fit: BoxFit.cover,
               image: AssetImage('assets/images/add1.jpg'),
             ),
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 children: [
                   SizedBox(
                     height: 60,
                   ),
                   IconButton(
                     padding: EdgeInsets.zero,
                       constraints: BoxConstraints(),
                       onPressed: () {
                         Get.back();
                       },
                       icon: Icon(
                         Icons.arrow_back,
                         color: AppColors.mainColor,
                       ))
                 ],
               ),
               Column(
                 children: [
                   TextFieldWidget(
                       textController: nameController,
                       hintText: 'Task name',readOnly: true,),
                   SizedBox(
                     height: 15,
                   ),
                   TextFieldWidget(
                     textController: detailController,
                     hintText: "Task detail",readOnly: true,
                     borderRadius: 15,
                     maxLines: 3,
                   ),
                 ],
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height / 29,
               )
             ],
           ),
         );
       }),)
     );
  }
}
