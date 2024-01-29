import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class TextFormFieldTheme {
  TextEditingController controller;
  String? labels;
  String? textWarning;
  TextInputType? keyboardType;
  List<String>? listForDropdown;
  String? hintText;
  BuildContext? context;
  bool haveValue;
  bool isOutline;

  TextFormFieldTheme({
    this.keyboardType,
    required this.controller,
    this.labels,
    this.textWarning,
    this.listForDropdown,
    this.hintText,
    this.context,
    this.haveValue = false,
    this.isOutline = false,
  });

  TextFormField get defaultTextFormField => TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          border: isOutline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 1,
                    color: ThemeData().mainColor(),
                  ),
                )
              : null,
          labelText: labels,
          hintText: hintText,
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
        decoration: InputDecoration(
          border: isOutline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 1,
                    color: ThemeData().mainColor(),
                  ),
                )
              : null,
          labelText: labels,
          hintText: hintText,
        ),
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
            border: isOutline
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                      color: ThemeData().mainColor(),
                    ),
                  )
                : null,
            labelText: labels,
            hintText: hintText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return textWarning;
          }
          return null;
        },
      );

  DropdownButtonFormField<String> get dropdownButtonFormField =>
      DropdownButtonFormField(
        items: listForDropdown?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.text = newValue!;
        },
        decoration: InputDecoration(
          border: isOutline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 1,
                    color: ThemeData().mainColor(),
                  ),
                )
              : null,
        ),
        hint: Text(hintText ?? ''),
        icon: SvgPicture.asset(icon.arrow),
      );

  TextFormField get textFormFieldForBirthDay => TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: isOutline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 1,
                    color: ThemeData().mainColor(),
                  ),
                )
              : null,
          labelText: labels,
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: () => selectDateFromPicker(),
            icon: SvgPicture.asset(icon.calendar),
          ),
        ),
      );

  Future<void> selectDateFromPicker() async {
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
