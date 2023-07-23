import 'package:doctor_appoinment_app/controller/medicine_controller.dart';
import 'package:doctor_appoinment_app/widget/app_bar.dart';
import 'package:doctor_appoinment_app/widget/carousel_slider.dart';
import 'package:doctor_appoinment_app/widget/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/medicine_model.dart';
class MedicineDetailsPage extends StatelessWidget {
  MedicineController medicineController = Get.find();
  int index;
  List<MedicineModel> medicineList;
  // MedicineModel medicineModel;
  MedicineDetailsPage({required this.medicineList,required this.index});


  @override
  Widget build(BuildContext context) {
    var medicine = medicineList[index];
    return Scaffold(
      backgroundColor: bgColor.withOpacity(.8),
      appBar: MyAppBar(),
      body: Column(
        children: [
          // AspectRatio(
          //   aspectRatio: 1.2,
          //     child: Image.asset(medicineController.medicineList[index].img.toString())),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: MyCarouselSlider(index: index,medicineList: medicineList,),
          ),
          Expanded(child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(medicine.name.toString(),style: TextStyle(color: Color(0xff172a38),fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 11,),
                  medicine.number_of_tablets! > 1?
                  Text("${medicine.number_of_tablets} tablets",style: TextStyle(color: Colors.black54,fontSize: 18),)
                      :Text("${medicine.number_of_tablets} Syroup",style: TextStyle(color: Colors.black54,fontSize: 18),),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8),
                      //   // width: 200,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(16),
                      //     border: Border.all(color: Colors.black26),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       IconButton(onPressed: (){
                      //         medicineController.decreaseQuantityCardList(index);
                      //       }, icon: Icon(Icons.remove,)),
                      //       GetBuilder<MedicineController>(builder: (controller) {
                      //         return Text(medicine.quantity.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),);
                      //       },),
                      //       IconButton(onPressed: (){
                      //         medicineController.increaseQuantityCardList(index);
                      //       }, icon: Icon(Icons.add,)),
                      //     ],
                      //   ),
                      // ),
                      // Spacer(),
                      GetBuilder<MedicineController>(builder: (controller) {
                        return Text("\$${medicine.price}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
                      },)
                    ],
                  ),

                  SizedBox(height: 16,),
                  Text("About the product",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 11,),
                  Text("${medicine.description}",maxLines: 4,style: TextStyle(fontSize: 16,color: Colors.black54,),),
                  Spacer(),
                  bottomPart()
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Row bottomPart() {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(color: Color(0xffe1e1e1)),
            border: Border.all(color: Colors.black26),
          ),
          child: IconButton(onPressed: (){
            medicineController.setFavorite(index);
          }, icon: GetBuilder<MedicineController>(builder: (controller) {
            return Icon(medicineController.medicineList[index].favorite == true? Icons.favorite:Icons.favorite_border,color: orangeColor,);
          },)
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: MaterialButton(onPressed: () {
            medicineController.addToCard(index);
          },
            elevation: 0,
            color: orangeColor,
            textColor: Colors.white,
            height: 60,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            child: const Text("Add to cart",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          ),
        )
      ],
    );
  }
}
