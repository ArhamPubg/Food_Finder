import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/BottamBar/bottam_bar.dart';
import 'package:food_app/Cubit/cubits.dart';
import 'package:food_app/Home/body.dart';
import 'package:food_app/Home/header.dart';
import 'package:food_app/Home/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [];

  void _onTabSelected(int index) {
    context.read<TabsCubit>().updateIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DockingBar(
        onTabSelected: _onTabSelected,
      ),
      backgroundColor: const Color(0xffF6F6F6),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Header(), Body(), Products()],
        ),
      ),
    );
  }
}
