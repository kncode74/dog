import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentCard extends StatelessWidget {
  Widget widget;

  DocumentCard({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget,
    );
  }
}
