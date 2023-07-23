 import 'package:doctor_appoinment_app/controller/medicine_controller.dart';
import 'package:doctor_appoinment_app/view/NavBar.dart';
import 'package:doctor_appoinment_app/view/doctor_page/appointment.dart';
import 'package:doctor_appoinment_app/view/home_page/HomePage.dart';
import 'package:doctor_appoinment_app/view/medicine_page/medicine_details_page.dart';
import 'package:doctor_appoinment_app/view/medicine_page/medicine_list_page.dart';
import 'package:doctor_appoinment_app/view/medicine_page/practice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MedicineController medicineController = Get.put(MedicineController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavBar()
      // home: ListPage()
    );
  }
}