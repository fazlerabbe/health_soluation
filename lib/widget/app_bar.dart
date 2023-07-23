import 'package:doctor_appoinment_app/controller/medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/card_list_page.dart';
import 'custom_color.dart';
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({
    super.key,
  });

  MedicineController medicineController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var action_icon_size = size.width*.07;
    return AppBar(
      backgroundColor: tealColor,
      leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),
      actions: [
        AspectRatio(
          aspectRatio: .7,
          child: Padding(
            padding: EdgeInsets.only(top: 10,right: 10),
            child: InkWell(
              onTap: (){},
              child: Badge(
                label: GetBuilder<MedicineController>(builder: (controller) {
                  return Text(medicineController.favoriteList.length.toString());
                },),
                child: Icon(Icons.favorite,size: action_icon_size,),
              ),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: .7,
          child: Padding(
            padding: EdgeInsets.only(top: 10,right: 10),
            child: InkWell(
              onTap: (){Get.to(CardPage());},
              child: Badge(
                label: GetBuilder<MedicineController>(builder: (controller) {
                  return Text(medicineController.cardList.length.toString());
                },),
                child: Icon(Icons.shopping_cart,size: action_icon_size,),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}