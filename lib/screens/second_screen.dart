import 'package:flutter/material.dart';
import 'package:realestate/models/house.dart';

class SecondScreen extends StatefulWidget {
  final House? data;
  SecondScreen({Key? key, House? this.data}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("hi"),
        ),
      ),
    );
  }
}
