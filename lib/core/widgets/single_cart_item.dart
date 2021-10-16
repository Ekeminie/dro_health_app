// ignore_for_file: prefer_const_constructors

import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/features/home/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'dropdown.dart';

class SingleCartItemWidget extends StatefulWidget {
  final CartModel? product;
  final VoidCallback deleteCallBack;
  final ValueChanged<int>? updateCountCallBack;
  const SingleCartItemWidget(
      {Key? key,
      this.product,
      required this.deleteCallBack,
      this.updateCountCallBack})
      : super(key: key);

  @override
  State<SingleCartItemWidget> createState() => _SingleCartItemWidgetState();
}

class _SingleCartItemWidgetState extends State<SingleCartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Expanded(
        child: Row(children: [
          Image.asset(
            widget.product!.product!.imageUri,
            height: 100,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 10),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(widget.product!.product!.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Pallet.textColorGrey)),
                ),
                SizedBox(height: 5),
                Text("Tablet \u{25CB} 500mg",
                    style:
                        TextStyle(fontSize: 10, color: Pallet.textColorGrey)),
                SizedBox(height: 8),
                Text("\u{20A6}${widget.product!.product!.amount.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                SizedBox(height: 8),
              ]),
        ]),
      ),
      Column(children: [
        MaterialDropdownView(
          onChangedCallback: (newValue) {
            setState(() {
              widget.updateCountCallBack!(newValue);
            });
          },
          value: widget.product!.quantity!.toString(),
          values: [
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10',
            '11',
            '12',
            '13',
            '14',
            '15'
          ],
        ),

        // SizedBox(height:10.h),
        Row(children: [
          Text("Remove", style: TextStyle(color: Pallet.purple)),
          IconButton(
              icon: Icon(Icons.delete_forever, color: Pallet.purple),
              onPressed: () {
                widget.deleteCallBack();
                
              })
        ])
      ]),
    ]));
  }
}
