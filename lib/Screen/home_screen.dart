import 'package:flutter/material.dart';
import 'package:task_management/utiles/colors.dart';
import 'package:task_management/widgets/bottonWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello',
                style: TextStyle(
                  color: AppColors.smallTextColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '\nStart your beautiful day',
                    style: TextStyle(
                      color: AppColors.textHolder,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/2.2   ,),
            BottonWidget(
                text: 'Add Task',
                textColor: AppColors.textHolder,
                backgroundncolor: AppColors.smallTextColor),
            SizedBox(height: 15,),
            BottonWidget(
                text: 'View All',
                textColor: AppColors.smallTextColor,
                backgroundncolor: AppColors.textHolder),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/hello.jpg'),
          ),
        ),
      ),
    );
  }
}
