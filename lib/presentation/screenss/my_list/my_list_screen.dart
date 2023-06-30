import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nazar/config/global/constants/image_routes.dart';
import 'package:nazar/config/global/widgets/project_app_bar.dart';
import 'package:nazar/config/theme/app_theme.dart';
import 'package:nazar/theme_notifier.dart';
import 'package:provider/provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: ProjectAppBar(
            appBarTitle: 'Saqlanganlar',
            actions: [
              SearchAppBarAction(),
            ],
          ),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Image.asset(
              themeNotifier.isDark
                  ? AppImagesRoute.emptyListDark
                  : AppImagesRoute.emptyListLight,
              height: 220.h,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 44),
            Text(
              "Ro'yxatingiz bo'sh",
              style: theme.textTheme.headlineMedium!
                  .copyWith(color: theme.primaryColor),
            ),
            const SizedBox(height: 16),
            Text(
              "Roʻyxatga hech qanday\n video qoʻshmaganga oʻxshaysiz",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(
                  color: AppDynamicColorBuilder.getGrey800AndWhite(context),
                  fontWeight: FontWeight.w500,
                  height: 1.5),
            ),
          ],
        )),
      ),
    );
  }
}
