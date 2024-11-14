import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/shared/Widgets/drop_down.dart';
import 'package:food_app/shared/constants/config.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Container(
        height: 110,
        decoration: const BoxDecoration(
          color: Color(0xffF6F6F6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              circleAvatar(),
              location(),
              drawerIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleAvatar() {
    return CircleAvatar(
      maxRadius: 28,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          AppConfig.personLogo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget location() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.location,
          size: 24,
        ),
        TitleDropdownButton()
      ],
    );
  }

  Widget drawerIcon() {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.filter_list,
          color: AppColor.black,
          size: 30,
        ));
  }
}
