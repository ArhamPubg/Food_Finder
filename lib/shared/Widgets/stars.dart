import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/config.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({super.key});

  @override
  StarRatingWidgetState createState() => StarRatingWidgetState();
}

class StarRatingWidgetState extends State<StarRatingWidget>
    with SingleTickerProviderStateMixin {
  double _rating = 5;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset localOffset =
            renderBox.globalToLocal(details.globalPosition);
        final double starWidth = renderBox.size.width / 5;
        final newRating = (localOffset.dx / starWidth).ceilToDouble();

        if (newRating != _rating) {
          setState(() {
            _rating = newRating;
            _controller.forward(from: 0.0); // Start animation
          });
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              bool isRated = _rating > index;
              return Opacity(
                opacity: 1.0,
                child: Transform.rotate(
                  angle: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.star,
                      color: isRated ? Colors.amber : AppColor.black,
                      size: isRated ? 22 : 22,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
