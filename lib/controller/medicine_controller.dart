import 'package:doctor_appoinment_app/model/medicine_model.dart';
import 'package:doctor_appoinment_app/widget/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MedicineController extends GetxController{
  // var isFavorite = false.obs;

  List<MedicineModel> medicineList = [];
  List<MedicineModel> favoriteList = [];
  List<MedicineModel> cardList = [];

  var totalAmount = 0;

  loadMedicineModel(){
    for(int i = 0; i<medicineDataList.length; i++){
      medicineList.add(medicineDataList[i]);
    }
  }

  void getTotal(){
    totalAmount = cardList!.map((item) => item.price!.toInt() * item.quantity)
        .reduce((value, element) => value + element);
  }

  void setFavorite(int index){
    medicineList[index].favorite = !medicineList[index].favorite;
    if(medicineList[index].favorite == true){
      favoriteList.add(medicineList[index]);
    }else{
      favoriteList.removeWhere((element) => element.id == medicineList[index].id);
    }
    update();
  }

  void addToCard(int index){
    try{
      cardList.firstWhere((element) => element.id == medicineList[index].id);
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
          backgroundColor: bgColor,
          "Already Exist", "Try another product"
      );
    }
    catch(e){
      cardList.add(medicineList[index]);
    }
    getTotal();
    update();
  }

  void increaseQuantity(int index){
    medicineList![index].quantity++;
    update();
  }

  void decreaseQuantity(int index){
    if(medicineList[index].quantity>1){
      medicineList![index].quantity--;
    }
    update();
  }
  int medicinePrice(int index){
   return medicineList[index].price! * medicineList[index].quantity;
  }


  void decreaseQuantityCardList(int index){
    if(cardList[index].quantity>1){
      cardList[index].quantity--;
    }
    getTotal();
    update();
  }
  void increaseQuantityCardList(int index){
    cardList[index].quantity++;
    getTotal();
    update();
  }
  int getPriceCardList(int index){
    return cardList[index].price! * cardList[index].quantity;
  }

  void deleteItem(int index){
    cardList!.removeAt(index);
    if(index != 0){
      getTotal();
    }
    else{
      totalAmount = 0;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadMedicineModel();
  }

}