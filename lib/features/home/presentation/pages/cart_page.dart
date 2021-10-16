// ignore_for_file: prefer_const_constructors

import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/core/widgets/custom_appbar.dart';
import 'package:dro_health_app/core/widgets/gradient_button.dart';
import 'package:dro_health_app/core/widgets/single_cart_item.dart';
import 'package:dro_health_app/features/home/data/models/cart_model.dart';
import 'package:dro_health_app/features/home/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

 



  @override
  Widget build(BuildContext context) {
       final ProductsBloc _bloc = BlocProvider.of<ProductsBloc>(context);
       print(" cart lenth is ${_bloc.cartObjects.length}");
    return BlocListener<ProductsBloc, ProductsState>(
      bloc:_bloc,
        listener: (context, state) {
          if (state is HasAddedCartProductsState){
            // cart = state.product!;
          }if(state is HasCartProductsState){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cart Updated"),
                            backgroundColor: Colors.green,
                          ));
          }
        },
        child:
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
          if (state is HasCartProductsState) {
            // cart = state.cartItems!;
          }

          return Scaffold(
            appBar: CustomAppbar(
              hasBackButtonn: false,
              barHeight: 120,
              bottomWidget: Container(
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
                child: Row(children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined,
                          color: Pallet.white),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Expanded(
                      child: Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Pallet.white),
                      Text("Cart",
                          style: TextStyle(
                              color: Pallet.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp)),
                    ],
                  )),
                  IconButton(
                      icon: Icon(Icons.favorite_border, color: Pallet.white),
                      onPressed: () {}),
                ]),
              ),
            ),
            body: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                  margin: EdgeInsets.only(
                      bottom: 20.h, left: 20.w, right: 20.w, top: 20.h),
                  child: _bloc.cartObjects.length==0? Center(child:Text("No Items in Your Cart")):ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _bloc.cartObjects.length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(right: 10.w, bottom: 10.h),
                            child: SingleCartItemWidget(product: _bloc.cartObjects[index],deleteCallBack: (){
                              _bloc.add(RemoveProductFromCartEvent(index:index));
                            },updateCountCallBack: (value){
                              _bloc.add(RemoveProductFromCartEvent(index:index));
                            }),
                          ))),
              SizedBox(height: 70.h),
            ])),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                          child: Text(
                            'Total: ',
                            //superscript is usually smaller in size
                            textScaleFactor: 0.9,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextSpan(
                            text: '\u{20A6} ${_bloc.totalCartAmount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black)),
                      ]),
                    ),
                    SizedBox(width: 20.w),
                    SizedBox(
                        width: 150,
                        child: CustomButton(
                          title: Text("Proceed",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Pallet.white)),
                        ))
                  ]),
            ),
          );
        }));
  }
}
