import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nazar/config/theme/app_theme.dart';
import 'package:nazar/presentation/screenss/base/base_screen.dart';
import 'package:nazar/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(428, 926),
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier themeNotifier, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
            themeNotifier.isDark ? AppTheme.darkMode : AppTheme.lightMode,
            home: const BaseScreen(),
          ),
        ),
      ),
    );
  }
}
