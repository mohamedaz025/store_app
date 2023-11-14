// ignore_for_file: must_be_immutable, camel_case_types, prefer_const_constructors, unused_local_variable, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/Book_now.dart';
import 'package:store_app/pages/edit_price.dart';

final _firestore = FirebaseFirestore.instance;

class Hoteldetails extends StatefulWidget {
  String hotelname;
  String linkImg1;
  String linkImg2;
  String stars;

  late String locationHote;
  Hoteldetails({
    super.key,
    required this.hotelname,
    required this.linkImg1,
    required this.linkImg2,
    required this.stars,
    required this.locationHote,
  });

  @override
  State<Hoteldetails> createState() => _HoteldetailsState();
}

class _HoteldetailsState extends State<Hoteldetails> {
  String? price;
  void getprice() async {
    final prices = await _firestore.collection(widget.hotelname).get();
    for (var price in prices.docs) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel_details "),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: // لجعل الحواف مستديرة
                          BorderRadius.circular(25), // لجعل الحواف مستديرة
                      // BorderRadius.only(    //  لجعل حافة محددة مستديرة
                      // topRight: Radius.circular(100),
                      // topLeft: Radius.circular(0),
                      // bottomLeft: Radius.circular(0),
                      // bottomRight: Radius.circular(0)
                      // ),
                      child: Image.network(
                        //  لاضافة صورة من الحهاز
                        widget.linkImg1,
                        fit: BoxFit.cover,
                        height: 250,
                        width: 400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: // لجعل الحواف مستديرة
                          BorderRadius.circular(25), // لجعل الحواف مستديرة
                      // BorderRadius.only(    //  لجعل حافة محددة مستديرة
                      // topRight: Radius.circular(100),
                      // topLeft: Radius.circular(0),
                      // bottomLeft: Radius.circular(0),
                      // bottomRight: Radius.circular(0)
                      // ),
                      child: Image.network(
                        //  لاضافة صورة من الحهاز
                        widget.linkImg2,
                        fit: BoxFit.cover,
                        height: 250,
                        width: 400,
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  Stars ${widget.stars}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_pin, color: Colors.orange),
                    Text("${widget.locationHote}   ")
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 13),
              Text(widget.hotelname,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection(widget.hotelname).snapshots(),
              builder: (context, snapshots) {
                List<Column> pricewidgets = [];
                if (!snapshots.hasData) {
                  return Center(
                    child:
                        CircularProgressIndicator(backgroundColor: Colors.blue),
                  );
                }

                final prices = snapshots.data!.docs;
                for (var price in prices) {
                  final datein = price.get('datein');
                  final dateout = price.get('dateout');
                  final pricesingle = price.get('pricesingle');
                  final pricedouble = price.get('pricedouble');
                  final pricetriple = price.get('pricetriple');
                  final pricechild1 = price.get('pricechild1');
                  final pricechild2 = price.get('pricechild2');
                  final pricewidget = Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, top: 10, right: 10, left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "In:$datein",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "to",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Out: $dateout",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.person),
                                              Text(
                                                "            single:  $pricesingle",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.person),
                                              Icon(Icons.person),
                                              Text(
                                                "      double: $pricedouble",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.person),
                                              Icon(Icons.person),
                                              Icon(Icons.person),
                                              Text(
                                                "triple:    $pricetriple",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.child_friendly),
                                              Text(
                                                "            child1: $pricechild1",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.child_friendly),
                                              Text(
                                                "            child2: $pricechild2",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Editprice(
                                                            //
                                                            hotelname: widget
                                                                .hotelname
                                                                .toString(),
                                                            datein: datein
                                                                .toString(),
                                                            dateout: dateout
                                                                .toString(),
                                                            pricesingle:
                                                                pricesingle
                                                                    .toString(),
                                                            pricedouble:
                                                                pricedouble
                                                                    .toString(),
                                                            pricetriple:
                                                                pricetriple
                                                                    .toString(),
                                                            pricechild1:
                                                                pricechild1
                                                                    .toString(),
                                                            pricechild2:
                                                                pricechild2
                                                                    .toString(),
                                                          )));
                                            },
                                            icon: Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () {
                                              CollectionReference users =
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          widget.hotelname);
                                              users
                                                  .doc(datein)
                                                  .delete()
                                                  .then((value) =>
                                                      print("User Deleted"))
                                                  .catchError((error) => print(
                                                      "Failed to delete user: $error"));
                                            },
                                            icon: Icon(Icons.delete)),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context,MaterialPageRoute(builder: (context) =>Booknow(
                                       hotelname: widget.hotelname.toString(),
                                       datein:datein.toString(),
                                       dateout:dateout.toString(),
                                       pricesingle: pricesingle.toString(),
                                       pricedouble: pricedouble.toString(),
                                       pricetriple: pricetriple.toString(),
                                       pricechild1: pricechild1.toString(),
                                       pricechild2: pricechild2.toString(),)));
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.orange),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.all(5)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                        ),
                                        child: Text(
                                          "book Naw",
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                  pricewidgets.add(pricewidget);
                }
                return Column(
                  children: pricewidgets,
                );
              })
        ]),
      ),
    );
  }
}
