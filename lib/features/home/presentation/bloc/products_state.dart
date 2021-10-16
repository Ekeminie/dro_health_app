part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class HasProductsAndCategoryState extends ProductsState {
  final List<Product>? products;
  final List<CategoryObject>? categories;
  final List<CartModel>? cartList;
  const HasProductsAndCategoryState({this.products, this.categories, this.cartList});
}

class HasCategoriesStates extends ProductsState {
  final List<CategoryObject>? categories;
 const HasCategoriesStates({this.categories});
}

class HasQueriedProductState extends ProductsState {
  final List<Product>? searchResults;
  const HasQueriedProductState({this.searchResults});
}

class HasCartProductsState extends ProductsState {
  final List<CartModel>? cartItems;
  const HasCartProductsState({this.cartItems});
}

class HasFavoriteProductsState extends ProductsState {
  final List<Product>? products;
  const HasFavoriteProductsState({this.products});
}

class HasRemovedCartProductsState extends ProductsState {}

class HasSelectedCategoryState extends ProductsState {
    final List<Product>? products;
  const HasSelectedCategoryState({this.products});
}

class HasAddedCartProductsState extends ProductsState {
  final List<CartModel>?product;

 const HasAddedCartProductsState({this.product});
}
