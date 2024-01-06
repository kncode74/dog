import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class TextFormFieldTheme {
  TextEditingController controller;
  String? labels;
  String? textWarning;
  TextInputType? keyboardType;
  List<String>? listFordropdown;
  String? hintText;
  BuildContext? context;

  TextFormFieldTheme(
      {this.keyboardType,
      required this.controller,
      this.labels,
      this.textWarning,
      this.listFordropdown,
      this.hintText,
      this.context});

  TextFormField get defaultTextFormField => TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          labelText: labels,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return textWarning;
          }
          return null;
        },
      );

  TextFormField get textFormFieldPrice => TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(15),
          ThousandsFormatter(),
        ],
        decoration: InputDecoration(labelText: labels),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return textWarning;
          }
          return null;
        },
      );
  TextFormField get textFieldDecimalSet => TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(15),
          ThousandsFormatter(allowFraction: true),
        ],
        decoration: InputDecoration(
          labelText: labels,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return textWarning;
          }
          return null;
        },
      );

  DropdownButtonFormField<String> get dropdownButtonFormField =>
      DropdownButtonFormField(
        items: listFordropdown?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller?.text = newValue!;
        },
        hint: Text(hintText ?? ''),
      );
  TextFormField get textFormFieldForBirthDay => TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labels,
            suffixIcon: IconButton(
              onPressed: () => _selectDateFromPicker(),
              icon: const Icon(Icons.calendar_today_outlined),
            )),
      );

  Future<void> _selectDateFromPicker() async {
    final DateTime? picked = await showDatePicker(
      context: context!,
      initialDate: DateTime(DateTime.now().year - 0),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      controller?.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
    }
  }
}
