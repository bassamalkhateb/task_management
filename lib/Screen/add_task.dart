import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_management/utiles/colors.dart';
import 'package:task_management/widgets/bottonWidget.dart';

import '../widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

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
                  height: 40,
                ),
                IconButton(
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
                BottonWidget(
                    text: 'Add',
                    textColor: AppColors.textHolder,
                    backgroundncolor: AppColors.smallTextColor)
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
