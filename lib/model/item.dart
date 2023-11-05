class Item {
  String imgPath;
  double price;
  String location;
  String details;
  String name;
  Item(
      {required this.imgPath,
      required this.price,
      required this.location,
      required this.name,
      required this.details});
}

final List<Item> item = [
  Item(
      name:"name 1",
      imgPath: "assets/img/1.webp",
      price: 212.99,
      location: "Sharm El Sheikh",
      details: "فندق 1"),
  Item(
    name:"name 2",
      imgPath: "assets/img/2.webp",
      price: 312.99,
      location: "Sharm El Sheikh",
      details: "2فندق"),
  Item(
    name:"name 3",
      imgPath: "assets/img/3.webp",
      price: 412.99,
      location: "Sharm El Sheikh",
      details: "فندق3 "),
  Item(
    name:"name 4",
      imgPath: "assets/img/4.webp",
      price: 512.99,
      location: "Sharm El Sheikh",
      details: "4فندق"),
  Item(
    name:"name 5",
      imgPath: "assets/img/5.webp",
      price: 612.99,
      location: "Sharm El Sheikh",
      details: "5فندق"),
  Item(
    name:"name 6",
      imgPath: "assets/img/6.webp",
      price: 712.99,
      location: "Sharm El Sheikh",
      details: "6فندق"),
  Item(
    name:"name 7",
      imgPath: "assets/img/7.webp",
      price: 812.99,
      location: "Sharm El Sheikh",
      details: "7فندق"),
  Item(
    name:"name 8",
      imgPath: "assets/img/8.webp",
      price: 912.99,
      location: "Sharm El Sheikh",
      details: "8فندق"),
];
