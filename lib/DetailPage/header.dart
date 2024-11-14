import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Cubit/cubits.dart';
import 'package:food_app/shared/Widgets/text_widget.dart';
import 'package:food_app/shared/Widgets/toast.dart';
import 'package:food_app/shared/constants/config.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return customAppBar();
  }

  Widget customAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(color: AppColor.appBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [backButton(), productTitle(), favouriteButton()],
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(30)),
      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 29,
            color: AppColor.white,
          )),
    );
  }

  Widget productTitle() {
    return const TextWidget(
        size: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        title: 'Details');
  }

  Widget favouriteButton() {
    return BlocBuilder<FavouriteCubit, bool>(builder: (context, isFav) {
      return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: isFav ? Colors.black : AppColor.white),
            color: isFav ? AppColor.white : Colors.black,
            borderRadius: BorderRadius.circular(30)),
        child: IconButton(
            onPressed: () {
              context.read<FavouriteCubit>().updateBool(isFav);

              isFav
                  ? Toast()
                      .showCustomToast(context, 'Item Successfully Favourite')
                  : Toast()
                      .showCustomToast(context, 'Item Removed From Favourite');
            },
            icon: Icon(
              Icons.favorite,
              size: 29,
              color: isFav ? Colors.black : AppColor.white,
            )),
      );
    });
  }
}
