import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Itembox extends StatelessWidget {
  String con1;
  double sheight;
  double amount;

  Itembox(this.con1, this.sheight, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amberAccent.shade100,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: sheight,
      child: Center(
        child: Text("$con1  ${NumberFormat("#,###.###").format(amount)}"),
      ),
    );
  }
}
