part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsAndCategoryEvents extends ProductsEvent {}

class GetCategoriesEvents extends ProductsEvent {}

class SearchProductsEvents extends ProductsEvent {
  final String? queryString;
  SearchProductsEvents({this.queryString});
}


class AddProductToCartEvent extends ProductsEvent {
  final Product? product;
  final int? quantity;
  AddProductToCartEvent({this.product, this.quantity});
}

class UpdateCartEvent extends ProductsEvent {
  final Product? product;
  final int? quantity;
  UpdateCartEvent({this.product, this.quantity});
}


class RemoveProductFromCartEvent extends ProductsEvent {
  final int? index;
  RemoveProductFromCartEvent({this.index});
}
class GetCartProductsEvents extends ProductsEvent {}

class SelectCategoryEvents extends ProductsEvent {
  final Category? category;
  final bool? isSelected;
  SelectCategoryEvents({this.category, this.isSelected});

}

class FavoriteProductsEvents extends ProductsEvent {}
