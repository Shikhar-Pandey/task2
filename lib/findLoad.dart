import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:task_2/backend_connection.dart';
import 'package:task_2/cardProperties.dart';
String mapKey = "AIzaSyCTVVijIWofDrI6LpSzhUqJIF90X-iyZmE";

class FindLoad extends StatefulWidget {

  @override
  _FindLoadState createState() => _FindLoadState();
}

class _FindLoadState extends State<FindLoad> {
  var jsonData;
  Future<List<CardsModal>> getCardsData() async {
    http.Response response = await http.get(
        'http://ec2-52-53-40-46.us-west-1.compute.amazonaws.com:8080/load');
    jsonData = json.decode(response.body);
    List<CardsModal> card = [];

    for (var json in jsonData) {
      CardsModal cardsModal = new CardsModal();
      cardsModal.loadingPoint = json["loadingPoint"];
      cardsModal.unloadingPoint = json["unloadingPoint"];
      cardsModal.productType = json["productType"];
      cardsModal.truckType = json["truckType"];
      cardsModal.noOfTrucks = json["noOfTrucks"];
      cardsModal.weight = json["weight"];
      cardsModal.comment = json["comment"];
      cardsModal.status = json["status"];
      card.add(cardsModal);
    }
    return card;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFF3F2F1),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                  Icon(Icons.keyboard_backspace_rounded)),
                              Expanded(
                                flex: 9,
                                child: Text(
                                  "Find Load",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                title: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter loading point",
                                      hintStyle:
                                      TextStyle(color: Colors.black)),
                                ),
                                trailing:
                                GestureDetector(child: Icon(Icons.close)),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                title: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter unloading point",
                                      hintStyle:
                                      TextStyle(color: Colors.black)),
                                ),
                                trailing: Icon(Icons.close),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Available Loads',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.indigo)),
                                  child: Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Filter",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          color: Colors.indigo.shade300,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                    future: getCardsData(),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      print(snapshot.data);
                                      if (snapshot.data == null) {
                                        return Container(
                                          child: Center(
                                              child: SpinKitWave(
                                                color: Colors.lightBlueAccent,
                                                size: 60,
                                              )
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        reverse: false,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) => DetailCard(
                                          loadingPoint: snapshot.data[index].loadingPoint,
                                          unloadingPoint: snapshot.data[index].unloadingPoint,
                                          productType: snapshot.data[index].productType,
                                          truckPreference: snapshot.data[index].truckType,
                                          noOfTrucks: snapshot.data[index].noOfTrucks,
                                          weight: snapshot.data[index].weight,
                                          isPending: snapshot.data[index].status == 'pending'
                                              ? true
                                              : false,
                                          comments: snapshot.data[index].comment,
                                          isCommentsEmpty:
                                          snapshot.data[index].comment == '' ? true : false,
                                        ),
                                      );
                                    }),
                              ],
                            ),

                          ],
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}
