// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:dro_health_app/features/home/data/models/product_model.dart';
import 'package:dro_health_app/features/home/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import '../pallet.dart';
import 'custom_outline_button.dart';
import 'gradient_button.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final Product? product;
  AddToCartBottomSheet({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0.r),
      ),
      padding: EdgeInsets.only(
        top: 25.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text("${product!.name} has been succesfully added to Cart",
                style: TextStyle(fontSize: 16, color: Pallet.textColorGrey)),
          ),
          SizedBox(height: 50),
          CustomButton(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) =>  CartPage()));
              },
              title: Text("View Cart", style: TextStyle(color: Pallet.white))),
          SizedBox(height: 20),
          CustomOutlineButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text("Continue Shopping",
                  style: TextStyle(color: Pallet.purple))),
          SizedBox(
            height: 30.0.h,
          )
        ],
      ),
    );
  }
}
