// ignore_for_file: prefer_const_constructors

import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dro_health_app/utils/extensions.dart';

class ProductTile extends StatelessWidget {
 final Product? product;
  ProductTile({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        elevation: 5,
        color: Pallet.white,
        child: SizedBox(
          width: 200,
          child: Column(children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(product?.imageUri ?? "assets/images/drugs/procold.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Stack(
                  children: [
                    Image.asset(
                   product?.imageUri ?? "assets/images/drugs/procold.jpg",
                    
                    fit: BoxFit.fitHeight,
                  ),
                    product!.needsPrescription ? Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 16.h,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                        ),
                        child: Center(
                          child: Text("Requires a Prescription",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ):SizedBox.shrink()
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:14.0, left:14, top:8, ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                Align(
                  alignment:Alignment.topLeft,
                  child: Text(product?.name ??"Paracetamol",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Pallet.textColorGrey)),
                ),
                SizedBox(height: 5),
                Text("${product?.type ?? "Tablet"} \u{25CB} ${product?.mass ?? "500mg"}",
                    style: TextStyle(
                        fontSize: 10,
                        color: Pallet.textColorGrey)),
                SizedBox(height: 8),
                Text("\u{20A6}${product?.amount.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        )),
                        SizedBox(height: 8),
              ]),
            )
          ]),
        ));
    //);
  }
}
