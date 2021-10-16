import 'package:dro_health_app/features/home/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/pallet.dart';
import 'features/home/presentation/bloc/products_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => BlocProvider<ProductsBloc>(
        create: (context) => ProductsBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          theme: ThemeData(
            fontFamily: "Proxima Nova",
            primarySwatch:
                Pallet().createMaterialColor(Pallet.purpleGradientLeft),
          ),
          home: HomePageView(),
        ),
      ),
    );
  }
}
