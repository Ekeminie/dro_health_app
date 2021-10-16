import 'package:dro_health_app/features/home/data/models/category_enum.dart';
import 'package:flutter/cupertino.dart';

class Product{
 String name="";
 String type="";
 String mass="";
int amount=0;
String imageUri="";
Category category;
bool needsPrescription;

Product({required this.name, required this.type,required this.mass,required this.amount,required this.imageUri, required this.category, this.needsPrescription=false});

}