import 'package:flutter/material.dart';
import 'package:nazar/config/global/widgets/movies_grid.dart';
import 'package:nazar/presentation/screenss/explore/widgets/movie_filters.dart';
import 'package:nazar/presentation/screenss/explore/widgets/search_and_filter.dart';
import 'package:nazar/theme_notifier.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SearchAndFilter(),
              SliverToBoxAdapter(
                child: MovieFilters(),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                sliver: MoviesGrid(
                  childCount: 6,
                  movieCategory: 'top_movies',
                  imageFormat: 'jpeg',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
