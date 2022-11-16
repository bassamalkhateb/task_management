import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_management/Screen/all_task_screen.dart';
import 'package:task_management/controller/data_Controller.dart';
import 'package:task_management/routes/routes.dart';
import 'package:task_management/utiles/colors.dart';
import 'package:task_management/widgets/bottonWidget.dart';
import 'package:task_management/widgets/task-error_or_warning.dart';

import '../widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    bool _dataValidation(){
      if(nameController.text.trim()==''){
        Message.taskErrorOrWarning('Task Name', 'Task name is Empty');
        return false;
      }else if(detailController.text.trim()==''){
        Message.taskErrorOrWarning('Task detail', 'Task detail is Empty');
        return false ;
      }else if(nameController.text.length<=10){
        Message.taskErrorOrWarning('Task Name', 'Your Task Name should be leats 10 character ');
        return false ;
      }else if(detailController.text.length<=20){
        Message.taskErrorOrWarning('Task detail', 'Your Task detail should be leats 20 character ');
        return false ;
      }
      return true;
    }

    return Scaffold(
      body: Container(
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
                    hintText: "Task name",
                    borderRadius: 30),
                SizedBox(
                  height: 15,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hintText: "Task Detail",
                  borderRadius: 15,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    if(_dataValidation()){
                      Get.find<DataController>().postData(nameController.text.trim(), detailController.text.trim());
                      Get.offNamed(RoutesClass.getAllTakRoute());

                    }
                  },
                  child: BottonWidget(
                      text: 'Add',
                      textColor: AppColors.textHolder,
                      backgroundncolor: AppColors.smallTextColor),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 29,
            )
          ],
        ),
      ),
    );
  }
}
