import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nazar/config/global/constants/image_routes.dart';
import 'package:nazar/config/theme/app_colors.dart';

import 'package:nazar/presentation/screenss/explore/explore_screen.dart';
import 'package:nazar/presentation/screenss/home/home_screen.dart';
import 'package:nazar/presentation/screenss/profile/profile_screen.dart';
import 'package:nazar/presentation/screenss/qr_code_read/screen.dart';
import 'package:nazar/presentation/screenss/qr_code_read/widgets/choice_video_screen.dart';

import '../my_list/my_list_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedBottomNavIndex,
        children: _getLayout(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomNavigationBar(
              currentIndex: _selectedBottomNavIndex,
              onTap: (value) {
                setState(() {
                  _selectedBottomNavIndex = value;
                });
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.grey500,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconHome),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconHomeSelected),
                    ),
                    label: 'Asosiy'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconExplore),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child:
                          SvgPicture.asset(AppImagesRoute.iconExploreSelected),
                    ),
                    label: 'Izlash'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconQrcodeScan),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(
                        AppImagesRoute.iconQrcodeScan,
                        color: Colors.red,
                      ),
                    ),
                    label: 'Scanner'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconMyList),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child:
                          SvgPicture.asset(AppImagesRoute.iconMyListSelected),
                    ),
                    label: 'Saqlanganlar'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconProfile),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child:
                          SvgPicture.asset(AppImagesRoute.iconProfileSelected),
                    ),
                    label: 'Profil'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _getLayout() => [
      const HomeScreen(),
      const ExploreScreen(),
      const QrCodeScanScreen(),
      //ChoiceVideoScreen(),
      const MyListScreen(),
      const ProfileScreen(),
    ];
