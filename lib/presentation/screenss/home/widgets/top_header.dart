import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nazar/config/global/constants/image_routes.dart';
import 'package:nazar/config/theme/app_colors.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Stack(
        children: [
          _TopImageSection(),
          //_TopIconsSection(),
          _BottomSection()
        ],
      ),
    );
  }
}
class _TopImageSection extends StatelessWidget {
  const _TopImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const designHeight = 926.0;
    const imageHeight = 400.0;

    final heightRatio = screenHeight / designHeight;

    final responsiveImageHeight = heightRatio * imageHeight;

    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: FractionalOffset.bottomLeft,
        end: FractionalOffset.center,
        colors: [
          Color(0xff181A20),
          Colors.white,
        ],
      ).createShader(bounds),
      blendMode: BlendMode.modulate,
      child: Image.asset(
        AppImagesRoute.homeTopHeaderImage,
        fit: BoxFit.fill,
        // height: MediaQuery.of(context).size.height * 0.43,
        height: responsiveImageHeight,
        width: double.infinity,
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Positioned(
      bottom: 24,
      left: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Samarqand Registon maydoni',
            style: theme.textTheme.headlineMedium!
                .copyWith(color: AppColors.white),
          ),
         const SizedBox(
            height: 8,
          ),
          Text(
            'Ulugʻbek, Tillakori, Sherdor ...',
            style: theme.textTheme.bodySmall!
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     SizedBox(
          //       height: 32,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: theme.primaryColor,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(100),
          //           ),
          //         ),
          //         onPressed: () {},
          //         child: Row(
          //           children: [
          //             SvgPicture.asset(AppImagesRoute.iconPlay),
          //             const SizedBox(
          //               width: 8,
          //             ),
          //             Text(
          //               'Play',
          //               style: theme.textTheme.bodyMedium!.copyWith(
          //                 color: AppColors.white,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 12,
          //     ),
          //     SizedBox(
          //       height: 32,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.transparent,
          //           shape: RoundedRectangleBorder(
          //             side: const BorderSide(color: AppColors.white, width: 2),
          //             borderRadius: BorderRadius.circular(100),
          //           ),
          //         ),
          //         onPressed: () {},
          //         child: Row(
          //           children: [
          //             SvgPicture.asset(AppImagesRoute.iconPlus),
          //             const SizedBox(
          //               width: 8,
          //             ),
          //             Text(
          //               'My List',
          //               style: theme.textTheme.bodyMedium!.copyWith(
          //                 color: AppColors.white,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
