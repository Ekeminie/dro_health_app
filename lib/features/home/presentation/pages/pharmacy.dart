// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:badges/badges.dart';
import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/core/widgets/category_item_widget.dart';
import 'package:dro_health_app/features/home/data/models/cart_model.dart';
import 'package:dro_health_app/features/home/data/models/category_model.dart';
import 'package:dro_health_app/features/home/data/models/product_model.dart';
import 'package:dro_health_app/features/home/presentation/bloc/products_bloc.dart';
import 'package:dro_health_app/features/home/presentation/pages/product_tile_widget.dart';
import 'package:dro_health_app/features/home/presentation/pages/single_product_page.dart';
import 'package:flutter/material.dart';
import 'package:dro_health_app/core/widgets/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_page.dart';
import 'category_page.dart';

class PharmacyPage extends StatefulWidget {
  PharmacyPage({Key? key}) : super(key: key);

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  List<CartModel>? _cartItems = [];

  List<Product>? shopItems = [];

  List<Product>? searchresults = [];

  List<CategoryObject>? categories = [];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final ProductsBloc _bloc = BlocProvider.of<ProductsBloc>(context);
    final size = MediaQuery.of(context).size;
    return BlocListener<ProductsBloc, ProductsState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is ProductsInitial) {
            // loadingData = true;
          }
          if (state is HasProductsAndCategoryState) {
            shopItems = state.products;
            categories = state.categories;
            searchText = '';
            searchresults = [];
          }
          if (state is HasAddedCartProductsState) {
            _cartItems = state.product;
          }

          if (state is HasSelectedCategoryState) {
            shopItems = [];
            shopItems = state.products;
          }

          if (state is HasQueriedProductState) {
            print("current page state: $state");
            searchresults = [];
            searchresults = state.searchResults;
            return _buildSearchResults(context);
          }
        },
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          print("produc page state: $state");

          return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: CustomAppbar(
                bottomWidget: Container(
                    margin: EdgeInsets.only(top: 40.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        Expanded(
                            child: Text("Pharmacy",
                                style: TextStyle(
                                    color: Pallet.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp))),
                        IconButton(
                            icon: Icon(Icons.favorite_border,
                                color: Pallet.white),
                            onPressed: () {}),
                        BlocBuilder<ProductsBloc, ProductsState>(
                          builder: (context, state) {
                            return IconButton(
                                icon: (_bloc.cartObjects.length != 0)
                                    ? Badge(
                                        badgeContent: Text(
                                            _bloc.cartObjects.length.toString(),
                                            style:
                                                TextStyle(color: Pallet.white)),
                                        child: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Pallet.white),
                                      )
                                    : Icon(Icons.shopping_cart_outlined,
                                        color: Pallet.white),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CartPage()));
                                });
                          },
                        ),
                      ]),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: TextField(
                          style: TextStyle(fontSize: 17, color: Pallet.white),
                          onChanged: (value) {
                            _bloc.add(SearchProductsEvents(queryString: value));
                            searchText = value;
                          },
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 17, color: Pallet.white),
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(14),
                          ),
                        ),
                      ),
                    ])),
              ),
              floatingActionButton: (state is HasQueriedProductState)
                  ? null
                  : FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CartPage()));
                      },
                      label: Row(children: [
                        Icon(Icons.shopping_cart_outlined, color: Pallet.white),
                        Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                            child: BlocBuilder<ProductsBloc, ProductsState>(
                              builder: (context, state) {
                                return Text(_bloc.cartObjects.length.toString(),
                                    style: TextStyle(fontSize: 12.sp));
                              },
                            ))
                      ]),
                      icon: Text('Checkout'),
                      backgroundColor: Pallet.redGradientRight,
                    ),
              body: (state is HasQueriedProductState)
                  ? _buildSearchResults(context)
                  : SingleChildScrollView(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(children: [
                                Icon(Icons.location_on_outlined),
                                SizedBox(width: 5.w),
                                RichText(
                                  text: TextSpan(
                                    text: 'Delivery in  ',
                                    style: DefaultTextStyle.of(context).style,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Lagos, NG',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ]),
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  decoration:
                                      BoxDecoration(color: Pallet.white),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("CATEGORIES",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Pallet
                                                            .textColorGrey)),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                CategoryPage(
                                                                  categories: _bloc
                                                                      .categories,
                                                                )));
                                                  },
                                                  child: Text("VIEW ALL",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color:
                                                              Pallet.purple)),
                                                ),
                                              ]),
                                        ),
                                        Container(
                                            height: 100.h,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: categories!.length,
                                                itemBuilder: (context, index) =>
                                                    InkWell(
                                                      onTap: (){
                                                        //check if a previous category was already selected
                                                        bool isAlreadySelected =
                                                            false;
                                                        if (categories![index]
                                                            .isSelected!) {
                                                          isAlreadySelected =
                                                              true;
                                                        }

                                                        //revert the list the initial state
                                                        
                                                        for (var e
                                                            in categories!) {
                                                          e.isSelected = false;
                                                        }

                                                        

//show selected category

                                                        setState(() {
                                                          if (!isAlreadySelected) {
                                                            categories![index]
                                                                    .isSelected =
                                                                true;
                                                            _bloc.add(SelectCategoryEvents(
                                                                category: categories![
                                                                        index]
                                                                    .category));
                                                          } 
                                                        });
                                                      },
                                                      child: CategoryItemWidget(
                                                        category:
                                                            categories![index],
                                                      ),
                                                    )))
                                      ])),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Text("SUGGESTIONS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Pallet.textColorGrey)),
                              ),
                              Center(
                                  child: Center(
                                      child: (shopItems!.length == 0)
                                          ? CircularProgressIndicator()
                                          : GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.all(5),
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                      //childAspectRatio: 3 / 2,
                                                      crossAxisSpacing: 20,
                                                      childAspectRatio: 0.9,
                                                      mainAxisSpacing: 10,
                                                      maxCrossAxisExtent:
                                                          size.height / 5.h),
                                              itemCount: shopItems?.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) => BlocProvider
                                                                  .value(
                                                                      value: BlocProvider.of<
                                                                              ProductsBloc>(
                                                                          context),
                                                                      child:
                                                                          SingleProductPage(
                                                                        product:
                                                                            shopItems![index],
                                                                        recommedations:
                                                                            shopItems,
                                                                      ))));
                                                    },
                                                    child: ProductTile(
                                                      product:
                                                          shopItems![index],
                                                    ));
                                              }))),
                              SizedBox(height: 70.h),
                            ]),
                      ),
                    ));
        }));
  }

  _buildSearchResults(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ProductsBloc _bloc = BlocProvider.of<ProductsBloc>(context);
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(color: Pallet.white),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Text("SEARCH RESULTS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Pallet.textColorGrey)),
                      ),
                      Center(
                          child: Center(
                              child: (_bloc.searchResults.length == 0)
                                  ? Column(children: [
                                      Image.asset(
                                        "assets/images/empty.jpg",
                                        height: 300.h,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      SizedBox(height: 10.h),
                                      Center(
                                          child: Text(
                                              "No Results found for $searchText"))
                                    ])
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.all(5),
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              //childAspectRatio: 3 / 2,
                                              crossAxisSpacing: 20,
                                              childAspectRatio: 0.9,
                                              mainAxisSpacing: 10,
                                              maxCrossAxisExtent:
                                                  size.height / 5.h),
                                      itemCount: _bloc.searchResults.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          BlocProvider.value(
                                                              value: BlocProvider
                                                                  .of<ProductsBloc>(
                                                                      context),
                                                              child:
                                                                  SingleProductPage(
                                                                product: _bloc
                                                                        .searchResults[
                                                                    index],
                                                                recommedations:
                                                                    _bloc
                                                                        .searchResults,
                                                              ))));
                                            },
                                            child: ProductTile(
                                              product:
                                                  _bloc.searchResults[index],
                                            ));
                                      }))),
                      SizedBox(height: 70.h),
                    ]),
                  ),
                ])));
  }

  sortProductsAccordingToCategory() {}
}
