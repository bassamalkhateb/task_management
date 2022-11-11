import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/Screen/home_screen.dart';
import 'package:task_management/utiles/colors.dart';
import 'package:task_management/widgets/bottonWidget.dart';
import 'package:task_management/widgets/task_widget.dart';

class AllTaskScreen extends StatelessWidget {
  const AllTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = ['Try Harder', 'Try Smarter'];
    final leftEditIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Color(0xff2e3253).withOpacity(0.5),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final righttDeleteIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: (){
                Get.to(()=>HomeScreen(),transition: Transition.fade,duration: Duration(seconds: 1));
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.mainColor,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/add1.jpg'))),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryColor,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: righttDeleteIcon,
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                height:450,
                                decoration: BoxDecoration(
                                  color: const Color(0xff2e3253).withOpacity(0.4),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft:  Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20,left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BottonWidget(
                                          text: 'View',
                                          textColor: AppColors.textHolder,
                                          backgroundncolor: AppColors.smallTextColor),
                                      SizedBox(height: 15,),
                                      BottonWidget(
                                          text: 'Edit',
                                          textColor: AppColors.TextGreu,
                                          backgroundncolor: AppColors.smallTextColor),
                                    ],
                                  ),
                                ),
                              );
                            });
                        return false;
                      } else {
                        return Future.delayed(Duration(seconds: 1),
                            () => direction == DismissDirection.endToStart);
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: TaskWidget(
                        text: myData[index],
                        color: Colors.blueGrey,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
