import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Cubit/cubits.dart';
import 'package:food_app/shared/Widgets/rounded_counter.dart';
import 'package:food_app/shared/Widgets/text_widget.dart';
import 'package:food_app/shared/Widgets/toast.dart';
import 'package:food_app/shared/constants/config.dart';
import 'package:food_app/shared/constants/gaphs.dart';

class Body extends StatefulWidget {
  final String image;
  final String title;
  const Body({super.key, required this.title, required this.image});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> sizeButtons = <String>['Small', 'Medium', 'Large'];

  @override
  Widget build(BuildContext context) {
    return customBody();
  }

  Widget customBody() {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleAndReveiws(widget.title),
              price(),
              calories(),
              diameter(),
              const CustomCounter(),
              size(),
              description(),
              addToCartButton()
            ],
          ),
        ),
        Positioned(top: 90, right: -80, child: image(widget.image))
      ],
    );
  }

  Widget titleAndReveiws(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 28),
      child: Container(
        height: 74,
        width: MediaQuery.sizeOf(context).width / 1.9,
        decoration: const BoxDecoration(color: AppColor.appBackgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                size: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                title: title),
            gaphsH8,
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                gaphsW8,
                TextWidget(
                    size: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    title: '4.8(105 reveiw)')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget image(String image) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.appBackgroundColor,
          borderRadius: BorderRadius.circular(200)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(200), child: Image.asset(image)),
    );
  }

  Widget price() {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 30),
      child: Container(
        height: 86,
        width: MediaQuery.sizeOf(context).width / 4.2,
        decoration: const BoxDecoration(color: AppColor.appBackgroundColor),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                size: 20,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                title: 'Price'),
            TextWidget(
                size: 40,
                color: AppColor.black,
                fontWeight: FontWeight.bold,
                title: '\$8.99')
          ],
        ),
      ),
    );
  }

  Widget calories() {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 22),
      child: Container(
        height: 59,
        width: MediaQuery.sizeOf(context).width / 5.7,
        decoration: const BoxDecoration(color: AppColor.appBackgroundColor),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                size: 19,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                title: 'Calories'),
            TextWidget(
                size: 21,
                color: AppColor.black,
                fontWeight: FontWeight.bold,
                title: '450 Cal')
          ],
        ),
      ),
    );
  }

  Widget diameter() {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 22),
      child: Container(
        height: 57,
        width: MediaQuery.sizeOf(context).width / 5.2,
        decoration: const BoxDecoration(color: AppColor.appBackgroundColor),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                size: 19,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                title: 'Diameter'),
            TextWidget(
                size: 21,
                color: AppColor.black,
                fontWeight: FontWeight.bold,
                title: '15.05 cm')
          ],
        ),
      ),
    );
  }

  Widget size() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 375,
        decoration: const BoxDecoration(color: AppColor.appBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                  size: 19,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  title: 'Size'),
              Row(
                children: sizeButtons.asMap().entries.map((size) {
                  int index = size.key;

                  return BlocBuilder<SizeButtonCubit, int>(
                      builder: (context, selectedIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          context.read<SizeButtonCubit>().updateIndex(index);
                        },
                        child: Container(
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.orange
                                  : AppColor.white,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                            child: TextWidget(
                                size: 19,
                                color: selectedIndex == index
                                    ? AppColor.white
                                    : AppColor.black,
                                fontWeight: FontWeight.bold,
                                title: sizeButtons[index]),
                          ),
                        ),
                      ),
                    );
                  });
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        height: 120,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(color: AppColor.appBackgroundColor),
        child: const TextWidget(
            size: 16,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            title:
                'Firebase is a comprehensive app development platform by Google that offers a suite of tools to build, improve, and grow apps. It provides real-time databases, authentication, cloud storage, and hosting, making backend development simpler.'),
      ),
    );
  }

  Widget addToCartButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () {
          Toast().showCustomToast(context, 'Item Add to Cart');
        },
        child: Container(
          height: 65,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(80)),
          child: const Center(
            child: TextWidget(
                size: 20,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                title: 'Add to Cart'),
          ),
        ),
      ),
    );
  }
}
