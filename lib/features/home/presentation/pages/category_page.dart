// ignore_for_file: prefer_const_constructors

import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/core/widgets/add_to_cart_bottomsheet.dart';
import 'package:dro_health_app/core/widgets/category_item_widget.dart';
import 'package:dro_health_app/core/widgets/custom_appbar.dart';
import 'package:dro_health_app/core/widgets/gradient_button.dart';
import 'package:dro_health_app/core/widgets/product_counter_widget.dart';
import 'package:dro_health_app/core/widgets/single_cart_item.dart';
import 'package:dro_health_app/features/home/data/models/category_model.dart';
import 'package:dro_health_app/features/home/presentation/pages/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dro_health_app/utils/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryPage extends StatefulWidget {
  final List<CategoryObject>? categories;
  const CategoryPage({Key? key, this.categories}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        hasBackButtonn: false,
        barHeight: 120,
        bottomWidget: Container(
          margin: EdgeInsets.only(top: 40.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
          child: Row(children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined, color: Pallet.white),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Text("Category",
                    style: TextStyle(
                        color: Pallet.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp)),
          
          ]),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        Container(
            margin: EdgeInsets.only(
                bottom: 20.h, left: 20.w, right: 20.w, top: 20.h),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                
                itemCount: widget.categories!.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(right: 10.w, bottom: 10.h),
                      child: CategoryItemWidget(category: widget.categories![index],),
                    ))),
        SizedBox(height: 70.h),
      ])),
     
    );
  }
}
