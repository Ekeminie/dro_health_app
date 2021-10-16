// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounterWidget extends StatefulWidget {
  ValueChanged<int> onChanged;
  int defaultValue;
  ProductCounterWidget(
      {required this.onChanged, Key? key, this.defaultValue = 0})
      : super(key: key);

  @override
  State<ProductCounterWidget> createState() => _ProductCounterWidgetState();
}

class _ProductCounterWidgetState extends State<ProductCounterWidget> {
  void _add() {
    setState(() {
      ++widget.defaultValue;
    });
    widget.onChanged(widget.defaultValue);
  }

  void _subtract() {
    if (widget.defaultValue != 0) {
      setState(() {
        --widget.defaultValue;
      });

      widget.onChanged(widget.defaultValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
      Row(children:[
        Container(
          height: 36.0.h,
          width: 70.w,
          child: Row(children: [
            GestureDetector(
                onTap: () {
                  _subtract();
                },
                child: Icon(Icons.remove)),
            SizedBox(width: 6.w),
            Text(widget.defaultValue.toString(),
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(width: 6.w),
            GestureDetector(
                onTap: () {
                  _add();
                },
                child: Icon(Icons.add)),
          ]),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ))),
      SizedBox(width: 10.w),
      Text("Pack(s)",
          style: TextStyle(
            fontSize: 14.sp,
          )),
      ]),
          

          RichText(
  text: TextSpan(children: [
    WidgetSpan(
      child: Transform.translate(
        offset: const Offset(2, -4),
        child: Text(
          '\u{20A6} ',
          //superscript is usually smaller in size
          textScaleFactor: 0.9,
          style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16,),
        ),
      ),
    ),
    TextSpan(
        text: '600',
        style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 24,color:Colors.black)),
    WidgetSpan(
      child: Transform.translate(
        offset: const Offset(2, 0),
        child: Text(
          '.00',
          //superscript is usually smaller in size
          textScaleFactor: 0.9,
          style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16,),
        ),
      ),
    )
  ]),
)
    ]));
  }
}
