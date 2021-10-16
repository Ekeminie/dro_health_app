import 'package:dro_health_app/features/home/data/models/cart_model.dart';
import 'package:dro_health_app/features/home/data/models/category_enum.dart';
import 'package:dro_health_app/features/home/data/models/category_model.dart';
import 'package:dro_health_app/features/home/data/models/product_model.dart';

class ProductsRepository {
  Future<List<Product>> getProducts() async {
    return _product;
  }

  Future<List<CategoryObject>> getCategories() async {
    return <CategoryObject>[
      CategoryObject(
          category: Category.Cough,
          imageUri: "assets/images/categories/cough.png",
          title: "Cough"),
      CategoryObject(
          category: Category.Fever,
          imageUri: "assets/images/categories/fever.jpg",
          title: "Fever"),
      CategoryObject(
          category: Category.Headaches,
          imageUri: "assets/images/categories/headache.jpg",
          title: "Headaches"),
      CategoryObject(
          category: Category.Infants,
          imageUri: "assets/images/categories/infants.jpg",
          title: "Infants"),
      CategoryObject(
          category: Category.Supplements,
          imageUri: "assets/images/categories/supplements.jpg",
          title: "Supplements"),
      CategoryObject(
          category: Category.Vitamins,
          imageUri: "assets/images/categories/vitamins.jpg",
          title: "Vitamins")
    ];
  }

  Future<List<Product>> getCartProducts() async {
    return <Product>[];
  }

  final _product = <Product>[
    Product(
        amount: 500,
        name: "Paracetamol",
        mass: "500mg",
        imageUri: "assets/images/drugs/paracetamol.jpg",
        type: "Tablet",
        category: Category.Headaches),
    Product(
        amount: 600,
        name: "Codliver Oil",
        mass: "500mg",
        imageUri: "assets/images/drugs/codliver_oil.png",
        type: "Tablet",
        category: Category.Supplements),
    Product(
        amount: 250,
        name: "Paracetamol",
        mass: "250mg",
        imageUri: "assets/images/drugs/paracetamol.jpg",
        type: "Tablet",
        category: Category.Headaches),
    Product(
        amount: 700,
        name: "Ibuprofen",
        mass: "500mg",
        imageUri: "assets/images/drugs/ibuprofen.jpg",
        type: "Tablet",
        category: Category.Headaches, 
        needsPrescription: true),
    Product(
        amount: 700,
        name: "Lonart",
        mass: "500mg",
        imageUri: "assets/images/drugs/lonart.jpg",
        type: "Tablet",
        category: Category.Fever),
    Product(
        amount: 800,
        name: "Panadol",
        mass: "500mg",
        imageUri: "assets/images/drugs/panadol.jpg",
        type: "Tablet",
        category: Category.Headaches),
    Product(
        amount: 800,
        name: "ProCold",
        mass: "500mg",
        imageUri: "assets/images/drugs/procold.jpg",
        type: "Tablet",
        category: Category.Cough),
    Product(
        amount: 900,
        name: "Seven Seas",
        mass: "500mg",
        imageUri: "assets/images/drugs/seven_seas.jpg",
        type: "Tablet",
        category: Category.Infants),
    Product(
        amount: 900,
        name: "Vitamin C",
        mass: "500mg",
        imageUri: "assets/images/drugs/vitamin_c.png",
        type: "Tablet",
        category: Category.Vitamins),
  ];
}
