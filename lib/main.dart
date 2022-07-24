import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DetailsPage.dart';
import 'UsersAdd.dart';
import 'mapPage.dart';
import 'globals.dart' as global;

void main() {
  runApp(const MyApp());
}

class AndroidGoogleMapsFlutter {
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  String Title = "Male";
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> maleData = [];
  List<Map<String, dynamic>> femaleData = [];
  bool showMap = false;
  String maleOrfemaleSelect="male";
  String latitude="";
  String longitude="";

  @override
  void initState() {
    // TODO: implement initState
    launchUrl();
    https: //randomuser.me/api/
    super.initState();
  }




  static final http.Client httpClient = http.Client();
  Future<dynamic> launchUrl() async {
    maleData.clear();
    femaleData.clear();
    print("ghchgchg");
    final data2 = await httpClient.get(
      Uri.parse('https://randomuser.me/api/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var data1 = json.decode(data2.body.toString());
    //parseData1(data1);
    debugPrint("sljnasjk" + data1.toString(), wrapWidth: 1024);
    for (int i = 0; i < data1["results"].length; i++) {
      print("vhvnb");
      print("i:"+i.toString());
      print("vhvnb:"+data1["results"][i]["gender"].toString());

      setState(() {


        if (data1["results"][i]["gender"] == "male") {
          print("if male " + data1["results"][i]["location"]["coordinates"].toString());


          latitude=data1["results"][i]["location"]["coordinates"]["latitude"].toString();
          longitude=data1["results"][i]["location"]["coordinates"]["longitude"].toString();
          print("latitude:"+latitude.toString());
          print("longitude:"+longitude.toString());
          maleData.add(data1["results"][i]);
        } else if (data1["results"][i]["gender"] == "female") {
          print("female else");
          print("if male " + data1["results"][i]["location"]["coordinates"].toString());


          latitude=data1["results"][i]["location"]["coordinates"]["latitude"].toString();
          longitude=data1["results"][i]["location"]["coordinates"]["longitude"].toString();
          print("latitude:"+latitude.toString());
          print("longitude:"+longitude.toString());

          femaleData.add(data1["results"][i]);
        }
      });
    }
    setState(() {
      data = maleData.toList();
    });
    print("ssjdkdkasd" + data.toString());
  }

 /* void loadMethod(){
    if(maleOrfemaleSelect=="male")
    {
      print("hiiiiiiiiiiiiiiiiii");
    }
    else if(maleOrfemaleSelect=="female")
    {
      print("hiiiiiiiiiiiiiiiiii alugweixlonywea xnoaye");
    }
  }*/


  @override
  Widget build(BuildContext context) {
    print("maleOrfemaleSelect:"+maleOrfemaleSelect.toString());
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(

      key: drawerKey,
      appBar: AppBar(
        title: Text(Title),
        leading: IconButton(
          onPressed: () {
            drawerKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu, color: Color(0xFFFFFFFFF)),
        ),
      ),
      drawer: Drawer(
          child: ListView(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    title: Text(
                      "Male",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        )
                    ),
                    leading: Icon(Icons.male_outlined,color: Colors.white,),
                    onTap: () {
                      setState(() {
                        data.clear();
                        Title = "Male";
                        showMap = false;
                        data = maleData.toList();
                        maleOrfemaleSelect="male";
                        global.maleOrfemaleSelect="male";
                        print("maleOrfemaleSelect:"+maleOrfemaleSelect.toString());
                      });
                      Navigator.pop(context);
                      /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDetails("Male")));*/
                    },
                  ),
                  Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      "Female",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        )
                    ),
                    leading: Icon(Icons.female_outlined,color: Colors.white),
                    onTap: () {
                      setState(() {
                        data.clear();
                        Title = "Female";
                        showMap = false;
                        data = femaleData.toList();
                        maleOrfemaleSelect="Female";
                        print("maleOrfemaleSelect:"+maleOrfemaleSelect.toString());
                      });
                      Navigator.pop(context);
                      /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDetails("Female")));*/
                    },
                  ),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Text(
                      "Map",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        )
                    ),
                    leading: Icon(Icons.location_on_outlined,color: Colors.white,size: 25),
                    onTap: () {
                      setState(() {
                        Title = "Map";
                        showMap = true;
                      });
                      Navigator.pop(context);
                      /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDetails("Map")));*/
                      ;
                    },
                  ),
                ],
              ),
            ),
          ])),
      body: Container(
        height: height,
        color: Colors.black12,
        child: showMap
            ? MpaDetails(latitude,longitude)
            : data.length > 0
            ?Container(child: Column(
          children: [
            ShowDetails(data),
           // maleOrfemaleSelect=="male"? Container(child:Text("Male")):Container(child:Text("Female"))
          ],
        ),)





            : Container(),
      ),

      floatingActionButton: showMap?Container():FloatingActionButton(
        onPressed: () async{
          final success = await
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  AddUsers()));
          if(success == true){
          setState(() {
            data.add(global.adduser);
          });}

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
