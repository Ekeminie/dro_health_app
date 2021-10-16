import 'package:flutter/material.dart';

class MaterialDropdownView extends StatelessWidget {
  final Function onChangedCallback;
  final String value;
  final Iterable<String> values;

  MaterialDropdownView(
      {required this.value,
      required this.values,
      required this.onChangedCallback});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 30,
        padding: const EdgeInsets.only(left: 15.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all()),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: this.value,
                items: this
                    .values
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  this.onChangedCallback(newValue);
                }),
          ),
        ),
      ),
    );
  }
}