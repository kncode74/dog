import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_vaccine.vm.dart';

class DogVaccineView extends BaseView<DogVaccineVM> {
  Widget render(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Vaccine'),
      ),
    );
  }
}
