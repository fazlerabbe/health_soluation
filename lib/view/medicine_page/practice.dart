import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_appoinment_app/controller/medicine_controller.dart';
import 'package:doctor_appoinment_app/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}
class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  MedicineController medicineController = Get.put(MedicineController());
  var imgList = [
    medicineDataList[0].img,
    medicineDataList[0].img,
    medicineDataList[0].img,
  ];
  int _current = 0;


  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = imgList
        .map((item) => Container(
      color: Colors.blue,
        child: Image.asset(item!, fit: BoxFit.cover, width: 1000.0)))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      body: Column(children: [
        CarouselSlider(
          // items: imageSliders,
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              // autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,

              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        // Text("Hello")
      ]),
    );
  }
}
