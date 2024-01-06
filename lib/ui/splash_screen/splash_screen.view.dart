import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm_boilerplate/ui/splash_screen/splash_screen.vm.dart';

import '../../application/base/base_view.dart';
import '../_style/text_styles.dart';

class SplashScreenView extends BaseView<SplashScreenController> {
  CollectionReference dogCollection =
      FirebaseFirestore.instance.collection("dog");
  @override
  Widget render(BuildContext context) {
    CollectionReference dogCollection =
        FirebaseFirestore.instance.collection('dog');
    TextEditingController name = TextEditingController();

    sendFirebase() async {
      dogCollection.doc().set({'data': name.text});
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(labelText: 'name'),
                ),
                ElevatedButton(
                    onPressed: () {
                      sendFirebase();
                    },
                    child: Text('save'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
