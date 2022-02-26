// Flutter imports:
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:icarus/helpers/appcolors.dart';
import 'package:icarus/helpers/iconhelper.dart';
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/services/loginservice.dart';
import 'package:icarus/widgets/iconfont.dart';
import 'package:icarus/widgets/themebutton.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);

    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/imgs/of_main_bg.png',
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Container(
                            width: 160,
                            height: 160,
                            color: AppColors.MAIN_COLOR,
                            alignment: Alignment.center,
                            child: IconFont(
                              iconName: IconFontHelper.LOGO,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Welcome to \nIcarus',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      animatedTextWidget(),
                      SizedBox(height: 20),
                      ThemeButton(
                        icon: SvgPicture.asset(
                          'assets/icons/google.svg',
                          height: 18,
                        ),
                        label: 'Connect with Google',
                        highlight: Colors.green[900],
                        color: AppColors.DARK_GREEN,
                        onClick: () async {
                          bool success = await loginService.signInWithGoogle();

                          if (success) {
                            Utils.mainAppNav.currentState!
                                .pushNamed('/loginsuccesspage');
                          }
                        },
                      ),
                      ThemeButton(
                        label: 'Try Now!',
                        highlight: Colors.green[900],
                        color: AppColors.MAIN_COLOR,
                        onClick: () {
                          Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                        },
                      ),
                      /*ThemeButton(
                        label: "Icarus Personal Action",
                        labelColor: AppColors.MAIN_COLOR,
                        color: Colors.transparent,
                        highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                        borderColor: AppColors.MAIN_COLOR,
                        borderWidth: 4,
                        onClick: () async {
                          launchURL("https://linkupp.netlify.app/");
                        },
                      ),*/
                    ],
                  ),
                )
              ],
            )));
  }

  // Animated Text
  Align animatedTextWidget() {
    return Align(
      child: RotateAnimatedTextKit(
        alignment: Alignment.center,
        text: [
          'Local Action, Global Impact',
          'Let’s reduce food waste.',
          'Together we make waves!',
          'Save the World!'
        ],
        textAlign: TextAlign.center,
        textStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  // URL
  static void launchURL(String url) async {
    if (url == null) {
      return;
    }
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not open website!';
      }
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
