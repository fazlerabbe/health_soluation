import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_appoinment_app/controller/medicine_controller.dart';
import 'package:doctor_appoinment_app/model/medicine_model.dart';
import 'package:doctor_appoinment_app/widget/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCarouselSlider extends StatelessWidget {

  int index;
  List<MedicineModel> medicineList = [];
  MyCarouselSlider({required this.index,required this.medicineList});

  MedicineController medicineController = Get.put(MedicineController());

  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var imgList = [
      medicineList[index].img,
      medicineList[index].img,
      medicineList[index].img,
    ];
    List<Widget> imageSliders = imgList
        .map((item) => Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Image.asset(item!, fit: BoxFit.cover, width: 1000.0)))
        .toList();

    return CarouselSlider(
      // items: imageSliders,
      items: imageSliders,
      carouselController: _controller,
      options: CarouselOptions(
        // autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 1.3,

          onPageChanged: (index, reason) {
            // setState(() {
            //   _current = index;
            // });
            _current = index;
          }),
    );
  }
}
