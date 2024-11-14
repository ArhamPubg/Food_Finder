import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Cubit/cubits.dart';
import 'package:food_app/shared/Widgets/text_widget.dart';
import 'package:food_app/shared/constants/config.dart';

class TitleDropdownButton extends StatefulWidget {
  const TitleDropdownButton({super.key});

  @override
  State<TitleDropdownButton> createState() => _TitleDropdownButtonState();
}

class _TitleDropdownButtonState extends State<TitleDropdownButton> {
  List<String> options = <String>[
    'Australia',
    'Pakistan',
    'England',
    'America'
  ];
  String dropdownValue = 'Pakistan';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? value) {
          context.read<DropdownCubit>().selectedCity(value);
        },
        underline: const SizedBox(),
        isExpanded: true,
        style: const TextStyle(color: AppColor.black),
        dropdownColor: AppColor.white,
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColor.black),
        selectedItemBuilder: (BuildContext context) {
          return options.map((String value) {
            return BlocBuilder<DropdownCubit, String>(
                builder: (context, selectedCity) {
              return Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                      size: 23,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      title: selectedCity));
            });
          }).toList();
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: TextWidget(
                size: 18,
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                title: value),
          );
        }).toList(),
      ),
    );
  }
}
