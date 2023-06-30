import 'package:flutter/material.dart';
import 'package:nazar/config/global/widgets/movie_card_item.dart';

class MovieList extends StatelessWidget {
  final int itemCount;
  final String movieCategory;
  final String imageFormat;

  const MovieList({
    super.key,
    required this.itemCount,
    required this.movieCategory,
    required this.imageFormat,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MovieCardItem(
            itemIndex: index,
            itemCount: itemCount,
            movieCategory: movieCategory,
            needsSpacing: true,
            imageFormat: imageFormat,
          ),
        ),
      ),
    );
  }
}
