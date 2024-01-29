import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentCard extends StatelessWidget {
  Widget widget;

  DocumentCard({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: widget,
    );
  }
}
