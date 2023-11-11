import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/hotel_details.dart';
import 'package:store_app/pages/Add_price.dart';
import 'package:store_app/pages/Edit_hotel.dart';

class HohelData extends StatelessWidget {
  final String? hotelname;
  final String? linkImg1;
  final String? linkImg2;
  final String? locationHotel;
  final String? stars;


  const HohelData(
      {super.key,
      this.hotelname,
      this.linkImg1,
      this.stars,
      this.linkImg2,
      this.locationHotel,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Hoteldetails(
                          //
                          hotelname: hotelname.toString(),
                          linkImg1: linkImg1.toString(),
                          linkImg2: linkImg2.toString(),
                          stars: stars.toString(),
                          locationHote: locationHotel.toString())));
            },
            child: GridTile(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(
                        topEnd: Radius.circular(20),
                        topStart: Radius.circular(20)),
                    child: Image.network(
                      //  لاضافة الصوره من الانترنت
                      "$linkImg1",
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      loadingBuilder: //  لعمل تحميل اذا كانت الصورة من الانترنت
                          (context, child, progress) {
                        return progress == null
                            ? child
                            : Container(
                                //   كونتينر لتحديد مكان دائرة التحميل
                                margin:
                                    const EdgeInsets.fromLTRB(50, 50, 50, 50),
                                child: const CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 0),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$hotelname ',
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.orange,
                      ),
                      Text(
                        '$locationHotel ',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Editdetails(
                                        hotelname: hotelname.toString(),
                                        link_img1: linkImg1.toString(),
                                        link_img_2: linkImg2.toString(),
                                        stars: stars.toString(),
                                        locationHote:
                                            locationHotel.toString())));
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  Addprice(
                                        hotelname: hotelname.toString(),)));
                        },
                        icon: const Icon(Icons.price_change_outlined),
                        color: Colors.yellow,
                      ),
                      IconButton(
                          onPressed: () {
                            CollectionReference deletehotel =
                                FirebaseFirestore.instance.collection('hotel');
                            deletehotel.doc(hotelname).delete();
                            print(hotelname);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
