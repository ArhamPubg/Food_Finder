import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Cubit/cubits.dart';
import 'package:food_app/shared/Widgets/text_widget.dart';
import 'package:food_app/shared/constants/config.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> categories = <String>['Biryani', 'Pizza', 'Salad', 'Burger'];
  List<dynamic> categoriesImages = [
    AppConfig.biryani,
    AppConfig.pizza,
    AppConfig.saalad,
    AppConfig.burger,
  ];

  int selectedIndex = 0;
  bool isClicked = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [bodyText(), textfield(), categoryTabs(), prductsHeading()],
      ),
    );
  }

  Widget bodyText() {
    return const Padding(
      padding: EdgeInsets.only(left: 25),
      child: TextWidget(
          size: 40,
          color: AppColor.black,
          fontWeight: FontWeight.bold,
          title: 'Ready To Order\nYour Favourite Food?'),
    );
  }

  Widget textfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextFormField(
        controller: searchController,
        cursorHeight: 18,
        cursorColor: AppColor.black,
        style: GoogleFonts.cabin(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18,
            height: 1.7, // Example line height
          ),
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: AppColor.black,
            size: 27,
          ),
          hintText: 'Search Your Food',
          hintStyle: GoogleFonts.cabin(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18,
              height: 1.7, // Example line height
            ),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.only(
            top: 25,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: const Color(0xffF6F6F6),
        ),
      ),
    );
  }

  Widget categoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Row(
          children: categories.asMap().entries.map((entry) {
            int index = entry.key;
            String name = entry.value;

            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  context.read<TabsIndexCubit>().updateIndex(index);
                },
                child: BlocBuilder<TabsIndexCubit, int>(
                  builder: (context, selectedIndex) {
                    return Container(
                      height: 60,
                      width: 140,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.orange
                            : const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(27),
                              child: Image.asset(
                                categoriesImages[index],
                                height: 50,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          TextWidget(
                            size: 18,
                            color: selectedIndex == index
                                ? const Color(0xffF6F6F6)
                                : AppColor.black,
                            fontWeight: FontWeight.bold,
                            title: name,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget prductsHeading() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
              size: 30,
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              title: 'Popular Foods'),
          TextWidget(
              size: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              title: 'See all')
        ],
      ),
    );
  }
}
