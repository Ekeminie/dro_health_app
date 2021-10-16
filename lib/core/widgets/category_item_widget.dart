// ignore_for_file: prefer_const_constructors

import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dro_health_app/utils/extensions.dart';


class CategoryItemWidget extends StatelessWidget {
  String? title, icon;
   CategoryObject? category;
   
  CategoryItemWidget({ Key? key, this.title, this.icon, this.category }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                                    margin: EdgeInsets.only(
                                        left: 10, bottom: 10, top: 10),
                                    height: 80,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      //border: Border.all(),
                                      color: category!.isSelected! ?Colors.blue.withOpacity(0.4): Colors.blue.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter:category!.isSelected! ? ColorFilter.mode(
                                            Colors.blue.withOpacity(0.5),
                                            BlendMode.darken): ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.darken),
                                        image: AssetImage(
                                            category?.imageUri ?? "categories/headache".jpg),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(category?.title ?? " ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Pallet.white))));
  }
}