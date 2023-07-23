import 'package:doctor_appoinment_app/model/doctorDetail.dart';
import 'package:doctor_appoinment_app/view/doctor_page/appointment.dart';
import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.cyan[800],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "DOCTORS",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.info_outline, color: Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(36)),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Center(
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  icon: Icon(Icons.search),
                                  border: InputBorder.none),
                            ),
                          ),
                        ))
                  ],
                ),
              )),
          Expanded(
            flex: 12,
            child: ListView.builder(
              itemCount: doctorItems.length,
              itemBuilder: (context, index) {
                var doctroItems = doctorItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DOCTOR NEARBY",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "SEE ALL",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                  "${doctorItems[index].profileImg}"),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${doctorItems[index].name}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "${doctorItems[index].subtitle}",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.blueGrey),
                                  ),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue.shade100,
                                      radius: 10,
                                      child: Icon(Icons.calendar_month_sharp,
                                          color: Colors.blue, size: 14),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "${doctorItems[index].year} years",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.blueGrey),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.red.shade100,
                                      radius: 10,
                                      child: Icon(Icons.favorite,
                                          color: Colors.red, size: 14),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${doctorItems[index].like} %",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.blueGrey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total fee",
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                Text(
                                  "${doctorItems[index].price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Apointment(doctroItems.profileImg, doctroItems.name, doctroItems.subtitle, doctroItems.price, doctroItems.year, doctroItems.like),));
                                  },
                                  child: Container(
                              decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(24)),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Center(
                                  child: Text(
                                    "Make an appointment",
                                    style: TextStyle(color: Colors.white),
                                  ),
                              ),
                            ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
