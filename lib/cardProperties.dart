import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  String productType;
  String loadingPoint;
  String unloadingPoint;
  String truckPreference;
  String noOfTrucks;
  String weight;
  bool isPending;
  String comments;
  bool isCommentsEmpty;

  DetailCard(
      {this.loadingPoint,
        this.unloadingPoint,
        this.productType,
        this.truckPreference,
        this.noOfTrucks,
        this.weight,
        this.isPending,
        this.comments,
        this.isCommentsEmpty});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 15,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "$loadingPoint",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 15,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "$unloadingPoint",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              Text("Truck Type",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  )),
                                              Text("$truckPreference",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Column(
                                            children: [
                                              Text("Weight",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  )),
                                              Text("$weight",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Text("Tyre",
                                              style: TextStyle(
                                                fontSize: 11,
                                              )),
                                          Text("NA",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text("Product Type",
                                              style: TextStyle(
                                                fontSize: 11,
                                              )),
                                          Text("$productType",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Image(
                        image: AssetImage("assets/truck load.png"),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 201, 217, 1.0),
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      "रु6000/tonne",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(21, 41, 104, 1.0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Bid",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.blueGrey[100].withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.apartment_outlined),
                      Text("Asian Paints")
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [Icon(Icons.call), Text("Call")],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}

//
//
// class TasksData extends ChangeNotifier {
//   List<CardTile> cards = [];
//
//   void addTasks(
//       String productType,
//       String loadingPoint,
//       String unloadingPoint,
//       String truckPreference,
//       String noOfTrucks,
//       String weight,
//       bool isPending,
//       String comments,
//       bool isCommentsEmpty,
//       ) {
//     cards.add(CardTile(
//         loadingPoint: loadingPoint,
//         unloadingPoint: unloadingPoint,
//         productType: productType,
//         truckPreference: truckPreference,
//         noOfTrucks: noOfTrucks,
//         weight: weight,
//         isPending: isPending,
//         comments: comments,
//         isCommentsEmpty: isCommentsEmpty));
//     notifyListeners();
//   }
// }
// //
// class MyAlertDialog extends StatelessWidget {
//   final String title;
//   final String content;
//   final List<Widget> actions;
//
//   MyAlertDialog({
//     this.title,
//     this.content,
//     this.actions = const [],
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(
//         this.title,
//         style: Theme.of(context).textTheme.title,
//       ),
//       actions: this.actions,
//       content: Text(
//         this.content,
//         style: Theme.of(context).textTheme.body1,
//       ),
//     );
//   }
// }
