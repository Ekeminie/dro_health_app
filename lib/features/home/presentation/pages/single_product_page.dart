// ignore_for_file: prefer_const_constructors

import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/core/widgets/add_to_cart_bottomsheet.dart';
import 'package:dro_health_app/core/widgets/custom_appbar.dart';
import 'package:dro_health_app/core/widgets/gradient_button.dart';
import 'package:dro_health_app/core/widgets/product_counter_widget.dart';
import 'package:dro_health_app/features/home/data/models/cart_model.dart';
import 'package:dro_health_app/features/home/data/models/product_model.dart';
import 'package:dro_health_app/features/home/presentation/bloc/products_bloc.dart';
import 'package:dro_health_app/features/home/presentation/pages/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dro_health_app/utils/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_page.dart';

class SingleProductPage extends StatefulWidget {
  final Product? product;
  final List<Product>? recommedations;
  const SingleProductPage({Key? key, this.product, this.recommedations})
      : super(key: key);

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  List<CartModel> cartItems = [];
  int amount = 0;
  @override
  Widget build(BuildContext context) {
     final ProductsBloc _bloc = BlocProvider.of<ProductsBloc>(context);
    final size = MediaQuery.of(context).size;
    return BlocListener<ProductsBloc, ProductsState>(
        listener: (context, state) {

        },
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is HasCartProductsState) {
            cartItems = state.cartItems!;
          }

          return Scaffold(
              appBar: CustomAppbar(
                hasBackButtonn: false,
                barHeight: 120,
                bottomWidget: Container(
                  margin: EdgeInsets.only(top: 40.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
                  child: Row(children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined,
                            color: Pallet.white),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Expanded(
                        child: Text("Pharmacy",
                            style: TextStyle(
                                color: Pallet.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp))),
                    IconButton(
                        icon: Icon(Icons.shopping_cart_outlined,
                            color: Pallet.white),
                        onPressed: () {
                           Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CartPage()));
                        }),
                  ]),
                ),
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                     SizedBox(height: 20.h),
                Center(
                  child: Image.asset(
                    widget.product!.imageUri,
                    height: size.height / 4,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Text(widget.product!.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
                SizedBox(height: 8),
                Text("Tablet \u{25CB} 500mg",
                    style:
                        TextStyle(fontSize: 14, color: Pallet.textColorGrey)),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage("drugs/emzor".jpg))),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("SOLD BY",
                                style: TextStyle(
                                    fontSize: 14, color: Pallet.textColorGrey)),
                            Text("Emzor Pharmaceuticals",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Pallet.blue,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                    Container(
                        width: 40.0,
                        height: 40.0,
                        child: Icon(Icons.favorite_border),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ]),
                ),
                SizedBox(height: 30),
                ProductCounterWidget(
                  onChanged: (val) {
                    amount = val;
                  },
                ),
                SizedBox(height: 40.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text("PRODUCT DETAILS",
                        style: TextStyle(
                            fontSize: 16,
                            color: Pallet.blue,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          _productDetailsWidget(
                              icon: "drugs/barcode".png,
                              title: "PRODUCT ID",
                              subtitle: "PRO23453453"),
                          _productDetailsWidget(
                              icon: "drugs/packaging".png,
                              title: "DISPENSED IN",
                              subtitle: "PRO23453453"),
                        ]),
                        SizedBox(width: 20),
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          _productDetailsWidget(
                              icon: "drugs/capsules".png,
                              title: "PACK",
                              subtitle: "PRO23453453"),
                          _productDetailsWidget(
                              icon: "drugs/pill".png,
                              title: "CONSTITUENTS",
                              subtitle: "PRO23453453"),
                        ]),
                      ]),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                      "1 Pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
                      style:
                          TextStyle(fontSize: 16, color: Pallet.textColorGrey)),
                ),
                SizedBox(height: 20.h),
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Text("SIMILAR PRODUCTS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Pallet.textColorGrey)),
                ),
                SizedBox(height: 10.h),
                Container(
                    margin: EdgeInsets.only(bottom: 20.h, left: 20.w),
                    height: 250.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  EdgeInsets.only(right: 10.w, bottom: 10.h),
                              child: ProductTile(
                                product: widget.recommedations![index],
                              ),
                            ))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButton(
                      onTap: () async {
                        if (amount == 0) {
                          print('show toast message');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please Select A Quantity"),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          _bloc.add(UpdateCartEvent(
                              product: widget.product, quantity: amount));
                          await showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30.0)),
                              ),
                              builder: (_) =>  AddToCartBottomSheet(
                                        product: widget.product),
                                  );
                        }
                      },
                      title: Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(Icons.shopping_cart_outlined, color: Pallet.white),
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ])),
                ),
                SizedBox(height: 70.h),
              ])));
        }));
  }

  Widget _productDetailsWidget(
      {String? title, String? icon, String? subtitle}) {
    return Container(
      height: 50,
      child: Row(children: [
        Image.asset(
          icon!,
          height: 25,
        ),
        SizedBox(width: 10.w),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title!, style: TextStyle(fontSize: 14, color: Pallet.blue)),
              Text(subtitle!,
                  style: TextStyle(
                      fontSize: 16,
                      color: Pallet.blue,
                      fontWeight: FontWeight.bold)),
            ]),
      ]),
    );
  }
}
