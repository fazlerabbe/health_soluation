import 'package:doctor_appoinment_app/controller/medicine_controller.dart';
import 'package:doctor_appoinment_app/view/medicine_page/medicine_details_page.dart';
import 'package:doctor_appoinment_app/view/medicine_page/medicine_list_page.dart';
import 'package:doctor_appoinment_app/widget/app_bar.dart';
import 'package:doctor_appoinment_app/widget/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  MedicineController medicineController = Get.find();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: MyAppBar(),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: GetBuilder<MedicineController>(builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.separated(
                      //todo: important concept

                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: medicineController.cardList.length,
                        itemBuilder: (context, index) {
                          // var jacket = cardController.cardList![index];
                          var medicine = medicineController.cardList[index];
                          return SizedBox(
                            height: 150,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        // Get.to(MedicineDetailsPage(index: index));
                                        Get.to(MedicineDetailsPage(medicineList: medicineController.cardList,index: index,));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(.3),
                                            borderRadius: BorderRadius.circular(25)),
                                        child: SizedBox(
                                          height: 170,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(medicineController.cardList[index].img.toString(),fit: BoxFit.cover,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 13,
                                        ),
                                        Text(
                                          medicineController.cardList[index].name.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Price: ${medicineController.getPriceCardList(index)}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        medicine.number_of_tablets! > 1?
                                        Text("${medicine.number_of_tablets} tablets",style: TextStyle(color: Colors.black54,fontSize: 16),)
                                            :Text("${medicine.number_of_tablets} Syroup",style: TextStyle(color: Colors.black54,fontSize: 16),),

                                        const Spacer(),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                medicineController.decreaseQuantityCardList(index);
                                              },
                                              child: const CircleAvatar(
                                                backgroundColor: Colors.orange,
                                                minRadius: 18,
                                                child: Icon(Icons.remove,color: Colors.black,),
                                              ),
                                            ),

                                            Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 13),
                                                child: Text(medicineController.cardList[index].quantity.toString(), style: TextStyle(fontSize: 20),)
                                            ),

                                            InkWell(
                                              onTap: () {
                                                medicineController.increaseQuantityCardList(index);
                                              },
                                              child: const CircleAvatar(
                                                minRadius: 18,
                                                backgroundColor: Colors.orange,
                                                child: Icon(Icons.add,color: Colors.black,),
                                              ),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                medicineController.deleteItem(index);
                                              },
                                              child: const CircleAvatar(
                                                minRadius: 18,
                                                backgroundColor: Colors.orange,
                                                child: Icon(Icons.delete,color: Colors.black,),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );}
                    ),
                  );
                },)
            ),
            Container(
              width: double.infinity,
              height: size.height * .07,
              color: Colors.orangeAccent,
              child: Center(child: GetBuilder<MedicineController>(builder: (controller) {
                return Text(
                  "Total Amount: ${medicineController.totalAmount.toString()}",
                  style: const TextStyle(fontSize: 20),
                );
              },)),
            )
          ],
        ));
  }
}
