import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

///StarRating creates a horizontal array of stars
///this code was taken from a Stack Overflow answer by Remi Rousselet at
///https://stackoverflow.com/questions/46637566/how-to-create-rating-star-bar-properly
class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double starSize = 16;

  const StarRating(
      {super.key,
      this.starCount = 5,
      required this.rating,
      required this.onRatingChanged,
      required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border_rounded,
        size: starSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half_rounded,
        color: color,
        size: starSize,
      );
    } else {
      icon = Icon(
        Icons.star_rate_rounded,
        color: color,
        size: starSize,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
