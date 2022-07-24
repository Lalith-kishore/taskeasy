import 'package:flutter/material.dart';

class ShowDetails extends StatefulWidget {
  List<Map<String, dynamic>> data;

  ShowDetails(this.data);
  @override
  _ShowDetailsState createState() => _ShowDetailsState(this.data);
}

class _ShowDetailsState extends State<ShowDetails> {
  List<Map<String, dynamic>> data;
  _ShowDetailsState(this.data);

  @override
  Widget build(BuildContext context) {
    print("sjdbaskjdbakdbkj" + data.toString());
    return Column(
      children: [
        Container(

            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height:220,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(

                      child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor: Colors.white,
                                    child: Image.network(
                                      "https://randomuser.me/api/portraits/men/4.jpg",
                                      height: 300,
                                      scale: 2,
                                      width: 100,
                                    ))),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      child: Text("Name :" +
                                          data[index]["name"]["title"] +
                                          data[index]["name"]["first"] +
                                          data[index]["name"]["last"],style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'calibri',
                                      ),)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      child:
                                          Text("D.O.B :" + data[index]["dob"]["date"],style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            fontFamily: 'calibri',
                                          ),)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      child: Text("EmailId :" + data[index]["email"],style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        fontFamily: 'calibri',
                                      ),)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      child: Text("Address :" +
                                          data[index]["location"]["street"]["number"]
                                              .toString() +
                                          data[index]["location"]["street"]["name"] +
                                          data[index]["location"]["city"] +
                                          data[index]["location"]["state"] +
                                          data[index]["location"]["country"] +
                                          data[index]["location"]["postcode"]
                                              .toString(),style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        fontFamily: 'calibri',
                                      ),),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      child:
                                          Text("Phone No. :" + data[index]["phone"],style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontFamily: 'calibri',
                                          ),)),
                                ],
                              ),
                            )
                          ],
                      ),
                    ),
                        )),
                  );
                })),
      ],
    );
  }
}
