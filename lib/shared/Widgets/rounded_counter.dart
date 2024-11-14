import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Cubit/cubits.dart';
import 'package:food_app/shared/constants/config.dart';
import 'package:food_app/shared/constants/gaphs.dart';

class CustomCounter extends StatefulWidget {
  final double? btnRadius;
  const CustomCounter({super.key, this.btnRadius});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  void _incrementCounter() {
    context.read<CustomCounterCubit>().incrementCounter();
  }

  void _decrementCounter() {
    context.read<CustomCounterCubit>().decrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 28),
      child: PrimaryContainer(
        radius: 10,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: BlocBuilder<CustomCounterCubit, CustomCounterState>(
                builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: _decrementCounter,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: state.isRemoveIconPressed
                            ? Colors.orange
                            : AppColor.white,
                        borderRadius:
                            BorderRadius.circular(widget.btnRadius ?? 2),
                      ),
                      child: const Icon(Icons.remove, size: 10),
                    ),
                  ),
                  gaphsW20,
                  Text(
                    state.counter.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  gaphsW20,
                  GestureDetector(
                    onTap: _incrementCounter,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: state.isAddIconPressed
                            ? Colors.orange
                            : AppColor.white,
                        borderRadius:
                            BorderRadius.circular(widget.btnRadius ?? 2),
                      ),
                      child: const Icon(Icons.add, size: 10),
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 30),
          color: Colors.black),
      child: child,
    );
  }
}
