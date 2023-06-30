import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nazar/config/global/constants/image_routes.dart';
import 'package:nazar/config/theme/app_theme.dart';
import 'package:nazar/presentation/screenss/home/widgets/movie_list.dart';
import 'package:nazar/presentation/screenss/home/widgets/movie_list_title.dart';
import 'package:nazar/presentation/screenss/home/widgets/top_header.dart';
import 'package:nazar/theme_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: SizedBox(
            height: 25.h,
            width: 25.w,
            child: Image.asset(AppImagesRoute.appLogo),
          ),
          actions: [
            SvgPicture.asset(
              AppImagesRoute.iconSearch,
              color: AppDynamicColorBuilder.getGrey900AndWhite(context),
            ),
            SizedBox(
              width: 24.w,
            ),
            SvgPicture.asset(AppImagesRoute.iconBell,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context)),
            SizedBox(
              width: 24.w,
            ),
          ],
          elevation: 0.0,
        ),
        body: const CustomScrollView(
          slivers: [
            TopHeader(),
            MovieListTitle(title: 'Top 10 Mashhur joylar'),
            MovieList(
              itemCount: 6,
              movieCategory: 'downloads',
              imageFormat: 'png',
            ),
            MovieListTitle(title: 'Yaqin atrofdagi'),
            MovieList(
              itemCount: 5,
              movieCategory: 'top_movies',
              imageFormat: 'jpeg',
            ),
            MovieListTitle(title: 'Rejalashtirilgan sayohatlar'),
            MovieList(
              itemCount: 6,
              movieCategory: 'new_movies',
              imageFormat: 'png',
            ),
            MovieListTitle(title: 'Milliy taomlar'),
            MovieList(
              itemCount: 4,
              movieCategory: 'top_national',
              imageFormat: 'jpeg',
            ),
            SliverPadding(padding: EdgeInsets.only(top: 24)),
          ],
        ),
      ),
    );
  }
}
