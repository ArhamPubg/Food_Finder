import 'package:flutter/material.dart';
import 'package:food_app/DetailPage/product_detail_page.dart';
import 'package:food_app/shared/Widgets/stars.dart';
import 'package:food_app/shared/Widgets/text_widget.dart';
import 'package:food_app/shared/constants/config.dart';
import 'package:food_app/shared/constants/gaphs.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with SingleTickerProviderStateMixin {
  bool up = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      reverseDuration: const Duration(milliseconds: 2300),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });

    controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    controller.dispose();
    super.dispose();
  }

  List<dynamic> productsImages = [
    AppConfig.biryani,
    AppConfig.biryani1,
    AppConfig.biryani2,
    AppConfig.biryani3,
  ];

  List<String> productsName = [
    'Chicken Biryani',
    'Bombay Biryani',
    'Indian Biryani',
    'Hydrabadi Biryani'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: productsImages.asMap().entries.map((image) {
            int index = image.key;
            return Padding(
              padding: const EdgeInsets.all(9.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ProductDetailPage(image: productsImages[index], title: productsName[index],)));
                },
                child: Container(
                  height: 315,
                  width: 225,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SlideTransition(
                          position: Tween<Offset>(
                                  begin: const Offset(0, -0.1),
                                  end: const Offset(0, 0.12))
                              .animate(controller),
                          child: Center(
                            child: Image.asset(
                              productsImages[index],
                              height: 185,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14, left: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                size: 20,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                title: productsName[index]),
                            const StarRatingWidget(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 22),
                        child: Row(
                          children: [
                            const TextWidget(
                                size: 16,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                                title: '2.5 km'),
                            gaphsW16,
                            Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            gaphsW8,
                            const TextWidget(
                                size: 15,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                                title: '20 min delivery'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
