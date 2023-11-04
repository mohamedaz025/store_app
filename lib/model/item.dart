class Item {
  String imgPath;
  double price;
  String location;
  Item({required this.imgPath, required this.price,required this.location});
}

final List<Item> item = [
  Item(imgPath: "assets/img/1.webp", price: 212.99, location: "shrm al shek"),
  Item(imgPath: "assets/img/2.webp", price: 312.99, location: "shrm al shek2"),
  Item(imgPath: "assets/img/3.webp", price: 412.99, location: "shrm al shek3"),
  Item(imgPath: "assets/img/4.webp", price: 512.99, location: "shrm al shek4"),
  Item(imgPath: "assets/img/5.webp", price: 612.99, location: "shrm al shek5"),
  Item(imgPath: "assets/img/6.webp", price: 712.99, location: "shrm al shek6"),
  Item(imgPath: "assets/img/7.webp", price: 812.99, location: "shrm al shek7"),
  Item(imgPath: "assets/img/8.webp", price: 912.99, location: "shrm al shek8"),
];
