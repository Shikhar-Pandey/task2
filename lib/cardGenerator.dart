import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'backend_connection.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cardProperties.dart';
String mapKey = "AIzaSyCTVVijIWofDrI6LpSzhUqJIF90X-iyZmE";

class CardTile {
  String productType;
  String loadingPoint;
  String unloadingPoint;
  String truckPreference;
  String noOfTrucks;
  String weight;
  bool isPending;
  String comments;
  bool isCommentsEmpty;

  CardTile(
      {this.loadingPoint,
      this.unloadingPoint,
      this.productType,
      this.truckPreference,
      this.noOfTrucks,
      this.weight,
      this.isPending = true,
      this.comments,
      this.isCommentsEmpty});
}

class CardScreen extends StatefulWidget {


  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  var jsonData;

  Future<List<CardsModal>> getCardsData() async {
    http.Response response = await http.get("http://10.0.2.2:55766/load");
    jsonData = await jsonDecode(response.body);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder(
                    future: getCardsData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: SpinKitDoubleBounce(
                              color: Colors.red,
                              size: 40,
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
              ),
                    ]),
                ),
              );
  }}
