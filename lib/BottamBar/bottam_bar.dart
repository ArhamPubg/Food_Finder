import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Cubit/cubits.dart';
import 'package:food_app/shared/constants/config.dart';

class DockingBar extends StatelessWidget {
  final Function(int) onTabSelected;

  const DockingBar({
    super.key,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      CupertinoIcons.home,
      CupertinoIcons.heart,
      CupertinoIcons.cart,
      CupertinoIcons.bell,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: BlocBuilder<TabsCubit, int>(builder: (context, activeIndex) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(icons.length, (i) {
                bool isSelected = i == activeIndex;
                return GestureDetector(
                  onTap: () => onTabSelected(i),
                  child: AnimatedContainer(
                    height: 60,
                    width: 60,
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.amber : AppColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      icons[i],
                      size: isSelected ? 34 : 30,
                      color: AppColor.black,
                    ),
                  ),
                );
              }),
            );
          })),
    );
  }
}
