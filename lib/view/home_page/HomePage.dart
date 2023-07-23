import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../widget/search_field.dart';
import 'CalendarWidget.dart';
import 'ServicesWidget.dart';
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _formatDayOfWeek(int day) {
    switch (day) {
      case 0:
        return 'Sun';
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE7EDF9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: Color(0xff07919D),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.waving_hand,color: Colors.orange,),
                                  SizedBox(width: 10,),
                                  Text("Hello,",style: TextStyle(color: Colors.white70,fontSize: 16),)
                                ],
                              ),
                              SizedBox(height: 11,),
                              const Text("George Floyd",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xffF2F9F9)),)
                            ],
                          ),
                          Spacer(),
                          const CircleAvatar(
                            minRadius: 25,
                            backgroundColor: Color(0xffD2D9E2),
                            backgroundImage: AssetImage("assets/images/user.png"),
                          )
                        ],
                      ),
                      SizedBox(height: 25,),
                      SearchField(formKey: _formKey, searchController: searchController,labelText: "Search"),
                      SizedBox(height: 20,),
                      CalendarWidget(),
                      SizedBox(height: 10,),
                      // Spacer(),
                      Row(
                        children:  [
                          SizedBox(width: 20,),
                          // Text("..",style: TextStyle(color: Color(0xfffefefe),fontSize: 30,fontWeight: FontWeight.w700),),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                              Container(
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                            ],
                          ),
                          SizedBox(width: 85,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                              Container(
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                            ],
                          ),
                          SizedBox(width: 35,),
                          // Expanded(flex :2,child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                              Container(
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                            ],
                          ),
                          SizedBox(width: 35,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                              Container(
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                            ],
                          ),
                          SizedBox(width: 85,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                              Container(
                                width: 5,height: 5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 11,),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  ServicesWidget(),
                  SizedBox(height: 11,),
                  Expanded(
                    flex:8,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("DAILY UPDATE",style: TextStyle(fontSize: 16,color: Color(0xff485782),fontWeight: FontWeight.w600)),
                                Spacer(),
                                Image.asset("assets/images/dot.png",width: 50,)
                                // Icon(Icons.more_vert)
                              ],
                            ),
                            SizedBox(height: 8,),

                            ListView.separated(
                              shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Symptoms of Covid to watch out for",style: TextStyle(fontSize: 18,color: Color(0xff485782),fontWeight: FontWeight.w500),),
                                        SizedBox(height: 11,),
                                        Text("August 09 - 08.23 AM",style:TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Image.asset("assets/images/medical_student.jpg"),
                                  )
                                ],
                              );
                            }, separatorBuilder:(context, index) => SizedBox(height: 16,), itemCount: 3)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

