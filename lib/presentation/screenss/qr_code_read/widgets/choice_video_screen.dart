import 'package:flutter/material.dart';
import 'package:nazar/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:nazar/config/global/widgets/project_app_bar.dart';
import 'package:nazar/config/theme/app_theme.dart';
import 'package:nazar/presentation/screenss/qr_code_read/widgets/webview_screen.dart';

class ChoiceVideoScreen extends StatelessWidget {
  const ChoiceVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: ProjectAppBar(
            appBarTitle: 'Tanlang',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/registon.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 16),
                  conText(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewScreen(
                              url:
                                  'https://www.youtube.com/watch?v=VuRol8-pwD0&t=254s',
                            ),
                          ),
                        );
                      },
                      text: "O'zbek tilidagi video"),
                  conText(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewScreen(
                              url:
                                  'https://www.youtube.com/watch?v=cFQWQbv31N8',
                            ),
                          ),
                        );
                      },
                      text: 'Видео на русском'),
                  conText(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewScreen(
                              url:
                                  'https://www.youtube.com/watch?v=IbK_KcnNIY8',
                            ),
                          ),
                        );
                      },
                      text: 'Video in English'),
                  conText(
                      onTap: () {
                        final snackBar = SnackBar(
                          content: const Text(
                            'Ishlov jarayonida. \nHozircha mavjud emas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      text: '🧏‍ Surdo '),
                  conText(
                      onTap: () {
                        // final snackBar = SnackBar(
                        //   content: const Text(
                        //     'Ishlov jarayonida. \nHozircha mavjud emas',
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewScreen(
                              url:
                                  'https://sketchfab.com/3d-models/registan-complex-samarkand-uzbekistan-drone-6a828d5314994cc28e8e14e4b0ede08e',
                            ),
                          ),
                        );
                      },
                      text: "3D"),
                  conText(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewScreen(
                              url:
                                  'https://www.google.com/search?q=360+view+registan&rlz=1C5CHFA_enUZ1026UZ1026&oq=360+view+registan&aqs=chrome..69i57j33i160.11379j0j7&sourceid=chrome&ie=UTF-8#fpstate=ive&vld=cid:665dfc9a,vid:ZjngYUx40Qc',
                            ),
                          ),
                        );
                      },
                      text: "360°"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget conText({
    required VoidCallback onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 8,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xfffbf9f9),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(
                0,
                0,
                0,
                0.25,
              ),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
