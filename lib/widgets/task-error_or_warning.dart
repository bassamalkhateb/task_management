import 'package:get/get.dart';
import 'package:task_management/utiles/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:task_management/utiles/colors.dart';

class Message {
  static void taskErrorOrWarning(String taskName, String taskErrorOrWarning) {
    Get.snackbar(taskName, taskErrorOrWarning,
        backgroundColor: AppColors.smallTextColor,
        titleText: Text(
          taskName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        messageText:Text(
      taskErrorOrWarning,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.amber,
      ),
    ),
    );
  }
}
