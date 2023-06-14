

import 'package:exam_serch_product/screen/provider/serch_provider.dart';
import 'package:exam_serch_product/screen/view/home_screen.dart';
import 'package:exam_serch_product/screen/view/product.dart';
import 'package:exam_serch_product/screen/view/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SerchProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
          'product':(context) => ProductScreen(),
          'view':(context) => ViewScreen(),
        },
      ),
    )
  );

}