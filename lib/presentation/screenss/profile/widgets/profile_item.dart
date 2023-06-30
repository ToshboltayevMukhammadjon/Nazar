import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nazar/config/global/constants/app_static_data.dart';
import 'package:nazar/config/global/constants/image_routes.dart';
import 'package:nazar/config/theme/app_colors.dart';
import 'package:nazar/config/theme/app_theme.dart';
import 'package:nazar/theme_notifier.dart';

class ProfileOptionItem extends StatelessWidget {
  final int index;
  final ThemeNotifier themeNotifier;
  const ProfileOptionItem({
    super.key,
    required this.index,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      title: Text(
        AppStaticData.profileOptionsData[index][0],
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppDynamicColorBuilder.getGrey900AndWhite(context),
        ),
      ),
      minLeadingWidth: 20,
      contentPadding: const EdgeInsets.all(0),
      visualDensity: VisualDensity(vertical: -2.w),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index == 0)
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                AppImagesRoute.iconArrowRight,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
            ),
          if (index == 1)
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                AppImagesRoute.iconArrowRight,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
            ),
          if (index == 2)
            GestureDetector(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (_)=> const DownloadScreen()));
              },
              child: SvgPicture.asset(
                AppImagesRoute.iconArrowRight,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
            ),
          if (index == 3)
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                AppImagesRoute.iconArrowRight,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
            ),
          if (index == 4)
            Text(
              "O'zbekcha (UZ)",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
            ),
          if (index == 5)
            Switch(
              activeColor: AppColors.white,
              inactiveThumbColor: theme.primaryColor,
              activeTrackColor: theme.primaryColor,
              value: themeNotifier.isDark,
              onChanged: (value) {
                themeNotifier.isDark
                    ? themeNotifier.isDark = false
                    : themeNotifier.isDark = true;
              },
            ),
          if (index == 6)
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                AppImagesRoute.iconArrowRight,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
            ),
          if (index == 7)
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                AppImagesRoute.iconArrowRight,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
            ),
        ],
      ),
      leading: SvgPicture.asset(
        AppStaticData.profileOptionsData[index][1],
        color: AppDynamicColorBuilder.getGrey900AndWhite(context),
      ),
    );
  }
}
