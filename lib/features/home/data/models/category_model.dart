import 'category_enum.dart';
import 'product_model.dart';

class CategoryObject{
  Category? category;
  String? imageUri;
  List<Product>? products;
  bool? isSelected;
String? title;
  CategoryObject({this.category, this.imageUri, this.products, this.title, this.isSelected=false});
}