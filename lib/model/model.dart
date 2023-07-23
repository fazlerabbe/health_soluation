import 'dart:ffi';

class DocModel {
  int? id;
  String? name;
  String details = "General Practitioner";
  String tfee = "Total fee";
  String fee = "\$80";
  String? img;

  DocModel({this.id, this.name, this.img});

  get image => null;
}

List<DocModel> docList = [
  DocModel(
    id: 1,
    name: "Drarrell Steward",
    img: "doc1.jpg",
  ),
  DocModel(
    id: 2,
    name: "Wade Warren",
    img: "doc2.jpg",
  ),
  DocModel(
    id: 3,
    name: "Jenny Wilson",
    img: "doc3.jpg",
  ),
];

class DocModel1 {
  int id;
  String name;
  String details = "General Practitioner";
  String tfee = "Total fee";
  String fee = "\$80";
  String img;

  DocModel1(this.id, this.name, this.img);

  static List<DocModel1> docInfo1() {
    return [DocModel1(1, "Shawon Ali", "images/doc1.jpg")];
  }
}
