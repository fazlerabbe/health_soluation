
import 'package:doctor_appoinment_app/view/medicine_page/medicine_list_page.dart';
import 'package:flutter/material.dart';

import '../doctor_page/doctorHome.dart';
import '../doctor_page/dumyPage.dart';

class ServicesWidget extends StatelessWidget {
  ServicesWidget({
    super.key,
  });

  var iconData = [
    "assets/images/virus.png",
    "assets/images/user_icon.png",
    "assets/images/pharmacy.png",
    "assets/images/tablet.png",
  ];
  var iconName = [
    "Covid 19",
    "Doctors",
    "Hospitals",
    "Medicines"
  ];

  var servicePages = [
    DummyPage(),
    DoctorPage(),
    DummyPage(),
    MedicineListPage()
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      flex:8,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.spaceBetween,

          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text("SERVICES",style: TextStyle(color: Color(0xff516088,),fontSize: 14,fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text("SEE ALL",style: TextStyle(color: Color(0xfffc8d25),fontSize: 14,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            // SizedBox(height: 11,),
            Expanded(
              flex: 5,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => servicePages[index],));
                      },
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffe2f2f3),
                            minRadius: 40,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff07919D),
                                  minRadius: 30,
                                  child: Image.asset("${iconData[index]}",fit: BoxFit.cover,width: 25,)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("${iconName[index]}"),
                          )
                        ],
                      ),
                    );
                  }, separatorBuilder: (context, index) => SizedBox(width: 13,), itemCount: 4),
            ),

          ],
        ),
      ),
    );
  }
}

