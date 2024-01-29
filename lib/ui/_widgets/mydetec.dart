import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class MyDetection extends StatefulWidget {
  const MyDetection({Key? key}) : super(key: key);

  @override
  State<MyDetection> createState() => _MyDetectionState();
}

class _MyDetectionState extends State<MyDetection> {
  bool _loading = true;
  File? _image;
  List _output = [];
  final _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  Future<void> pickImage() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  Future<void> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _output = output!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ค้นหาข้อมูลสุนัข')),
      body: _loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Container()
                : Container(
              child: Image.file(_image!),
              height: 500,
              width: MediaQuery.of(context).size.width - 200,
            ),
            const SizedBox(height: 20),
            _output.isNotEmpty
                ? Text(
              '${_output[0]['label']}'
                  .replaceAll(RegExp(r'[-9]'), ''),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                background: Paint()..color = Colors.white,
              ),
            )
                : const Text('Classify Waiting')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}