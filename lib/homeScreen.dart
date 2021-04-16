import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'box-item.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("skyline"),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.blueGrey.shade400),
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Itembox("ส่งมาแล้วจ้าา", 200, 2000230.303),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade400,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: 100,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Container2-1",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text("Container2-2", textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text(
                        "Container2-3",
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Itembox("ส่งมาแล้วจ้าา", 200, 10203.343),
              Text("Container Main")
            ],
          ),
        ));
  }
}
