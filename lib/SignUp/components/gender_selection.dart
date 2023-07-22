import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_project/controller/gender_selection_controller.dart';

// ignore: must_be_immutable
class GenderSelection extends StatelessWidget {
  GenderSelectionController genderSelectionController = Get.find();

  GenderSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Gender",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
          ),
          Row(
            children: [
              Obx(
                () => Radio(
                    activeColor: Colors.purple,
                    fillColor: MaterialStateProperty.all(Colors.purple),
                    value: "Male",
                    groupValue: genderSelectionController.selectionGender.value,
                    onChanged: (value) {
                      genderSelectionController.onChangedGender(value);
                    }),
              ),
              Text(
                "Male",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              )
            ],
          ),
          Row(
            children: [
              Obx(
                () => Radio(
                    activeColor: Colors.purple,
                    fillColor: MaterialStateProperty.all(Colors.purple),
                    value: "Female",
                    groupValue: genderSelectionController.selectionGender.value,
                    onChanged: (value) {
                      genderSelectionController.onChangedGender(value);
                    }),
              ),
              Text(
                "Female",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              )
            ],
          )
        ],
      ),
    );
  }
}
