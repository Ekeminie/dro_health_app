import 'package:bloc/bloc.dart';
import 'package:dro_health_app/features/home/data/models/cart_model.dart';
import 'package:dro_health_app/features/home/data/models/category_enum.dart';
import 'package:dro_health_app/features/home/data/models/category_model.dart';
import 'package:dro_health_app/features/home/data/models/product_model.dart';
import 'package:dro_health_app/features/home/data/repository/products_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsRepository productsRepo = ProductsRepository();

  int get totalCartAmount => cartObjects.fold(
      0, (total, item) => total + (item.product!.amount * item.quantity!));

  List<CartModel> cartObjects = [];
  List<CategoryObject>? categories = [];
  List<Product> searchResults = [];
  List<Product>? shopItems = [];

  ProductsBloc() : super(ProductsInitial()) {
    add(GetProductsAndCategoryEvents());
    add(GetCartProductsEvents());
  }

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is GetProductsAndCategoryEvents) {
      var categoriesResult = await productsRepo.getCategories();
      var products = await productsRepo.getProducts();

      //clear the previous list
      searchResults = [];
      shopItems = [];

      shopItems = products;
      categories =categoriesResult;
      yield HasProductsAndCategoryState(
          categories: categories, products: shopItems);
    }

    if (event is SearchProductsEvents) {
      searchResults = [];
      if (event.queryString!.trim().isNotEmpty) {
        for (var item in shopItems!) {
          if (item.name
              .toLowerCase()
              .contains(event.queryString!.toLowerCase())) {
            searchResults.add(item);
          }
        }

        yield HasQueriedProductState(searchResults: searchResults);
      } else {
        yield HasProductsAndCategoryState(
            categories: categories, products: shopItems);
      }
    }

    if (event is AddProductToCartEvent) {
      cartObjects.forEach((element) {
        if (element.product!.name == event.product!.name &&
            element.product!.amount == event.product!.amount) {
          element.quantity = (element.quantity! + 1);
        } else {
          cartObjects.add(CartModel(product: event.product, quantity: 1));
        }
      });

      yield HasAddedCartProductsState(product: cartObjects);
    }

    if (event is UpdateCartEvent) {
      // cartObjects.forEach((element) {
      // if (element.product!.name == event.product!.name &&
      // element.product!.amount == event.product!.amount) {
      // element.quantity = event.quantity;
      // } else {
      cartObjects
          .add(CartModel(product: event.product, quantity: event.quantity));
      // }
      // });

      print(cartObjects.length);
      yield HasAddedCartProductsState(product: cartObjects);
    }

    if (event is RemoveProductFromCartEvent) {
      print(event.index);
      cartObjects.removeAt(event.index!);

      yield HasAddedCartProductsState(product: cartObjects);
    }

    if (event is GetCartProductsEvents) {
      yield HasCartProductsState(cartItems: cartObjects);
    }



    if(event is SelectCategoryEvents){
      List<Product>? results=[];

      for(var item in shopItems!){
        if(item.category==event.category){
          results.add(item);
      }
       yield HasSelectedCategoryState(products: results);
    }
  }
}
}