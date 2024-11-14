import 'package:flutter/material.dart';
import 'package:food_app/DetailPage/header.dart';
import 'package:food_app/DetailPage/body.dart';
import 'package:food_app/shared/constants/config.dart';

class ProductDetailPage extends StatefulWidget {
  final String image;
  final String title;
  const ProductDetailPage(
      {super.key, required this.title, required this.image});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const Header(), Body(image:widget.image, title: widget.title,)],
        ),
      ),
    );
  }
}
