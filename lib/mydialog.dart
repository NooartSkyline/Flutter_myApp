import 'package:flutter/material.dart';

Future<void> MyDialog(
    BuildContext context, String title, String subtitle) async {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              leading: Image.asset("assets/images/netfix.jpg"),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Colors.deepPurpleAccent.shade100),
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ));
}
