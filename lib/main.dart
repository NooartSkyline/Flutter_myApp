import 'package:flutter/material.dart';
import 'package:my_app/homeScreen.dart';

import 'Check-null.dart';
import 'get-http.dart';
import 'menuFood.dart';
import 'model/model.dart';
import 'mydialog.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  runApp(Myapp());

  //ใส่ Await เพื่อรอรับค่า
  // print(await uSer());
  // await getData();
  print("Next....");
  // GetHttp getH = GetHttp();
  // Model mo = Model();
  // mo = await getH.getHTTPData();
  // print(mo.results);
  // _list = await getH.getHTTPApi();
}

// //Asynchronous & Future
// Future<String> uSer() async {
//   var us = await getData();
//   return us;
// }

// Future<String> getData() async {
//   return Future.delayed(Duration(seconds: 10), () => "วิทวัส บุญญา");
// }

//สร้าง เอง st Widget ที่ไม่สามารถเปลี่ยนแปลงค่าได้
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Myapp",
      home: HomgePage(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

// Widget ที่สามารถเปลี่ยนแปลงค่าได้
class HomgePage extends StatefulWidget {
  @override
  _HomgePageState createState() => _HomgePageState();
}

class _HomgePageState extends State<HomgePage> {
  ICheckNull isnull = ICheckNull();
  // List<ModelSir> _list;

  int num = 0; //การสร้าง State
  List<Food> menu = [
    Food("แมวย่าง", "5020", "assets/images/netfix.jpg"),
    Food("ปลาย่าง", "3003", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("นกย่าง", "560", "assets/images/netfix.jpg"),
    Food("ไส้ย่าง", "560", "assets/images/netfix.jpg"),
    Food("คอย่าง", "5600", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "5640", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "5630", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "5630", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "5603", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "5603", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "5603", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "560", "assets/images/netfix.jpg"),
    Food("หมาย่าง", "98009", "assets/images/netfix.jpg"),
  ];

  //เรียกใช้งานก่อน build
  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    print("เรียกใช้งาน initState");
    // isnull.CheckIsnull();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("ออกจากApp");
  }

// build จะถูกเรียกทุกครั้งที่มีการ setState
  @override
  Widget build(BuildContext context) {
    print("เรียกใช้งาน build");
    GetHttp getH = GetHttp();
    return Scaffold(
        //ส่วนหัวของแอพ
        //
        appBar: AppBar(
          title: Center(
              child: Column(
            children: [
              // LinearProgressIndicator(),
              Text(
                'Menu',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          )),
        ),
        //ส่วนรายละเอียด
        body: FutureBuilder(
            //ใช้ดึงข้อมูล
            future: getH.getHTTPData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Model mo = Model();
                var mo = snapshot.data;
                print("Load..." + mo.results.toString());

                return Container(
                  child: ListView.builder(
                      itemCount: menu.length,
                      itemBuilder: (BuildContext context, int index) {
                        Food food = menu[index];
                        return ListTile(
                            leading: Image.asset(food.img),
                            title: Text("เมนูที่ ${index + 1} ${food.name}"),
                            subtitle: Text(
                                "ราคา : ${NumberFormat("#,###.###").format(double.parse(food.price))} บาท"),
                            onTap: () => {
                                  print(
                                      "คุณเลือกเมนู ${food.name} ราคา ${NumberFormat("#,###.###").format(double.parse(food.price))} บาท"),
                                  MyDialog(
                                      context,
                                      food.name,
                                      NumberFormat("#,###.###")
                                          .format(double.parse(food.price)))
                                });
                      }),
                );

                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homeScreen()));
                    setState(() {
                      num++;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "เพิ่ม $num",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                );
              }
              return LinearProgressIndicator();
            })
        // decoration: BoxDecoration(color: Colors.blueGrey.shade400),
        //
        );
  }

  // void addNum() {
  //   setState(() {
  //     if (num == 10) {
  //       num = 0;
  //     }
  //     num++;
  //   });
  // }
}
