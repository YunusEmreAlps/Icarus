// Flutter imports:
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/helpers/appcolors.dart';
import 'package:icarus/helpers/iconhelper.dart';
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/services/categoryservice.dart';
import 'package:icarus/widgets/iconfont.dart';

class SplashPage extends StatelessWidget {
  int? duration = 0;
  String? goToPage;
  String? appName =  'Icarus';
  String? splashTxt =  'Connecting...';
  

  SplashPage({this.goToPage, this.duration});

  @override
  Widget build(BuildContext context) {
    CategoryService catService =
        Provider.of<CategoryService>(context, listen: false);

    Future.delayed(Duration(seconds: this.duration!), () async {
      // await for the Firebase initialization to occur
      FirebaseApp app = await Firebase.initializeApp();

      catService.getCategoriesCollectionFromFirebase().then((value) {
        Utils.mainAppNav.currentState!.pushNamed(this.goToPage!);
      });
    });

    return Material(
      child: Container(
        color: AppColors.MAIN_COLOR,
        alignment: Alignment.center,
        child: Stack(
          children: [
            iconWidget(),
            loadingWidget(),
            animatedTextWidget(),
          ],
        ),
      ),
    );
  }

  // Icarus Logo
  Align iconWidget() {
    return Align(
      child: IconFont(
          color: Colors.white, iconName: IconFontHelper.LOGO, size: 80),
      alignment: Alignment.center,
    );
  }

  // Loading...
  Align loadingWidget() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150,
        height: 150,
        child: CircularProgressIndicator(
          strokeWidth: 10,
          valueColor:
              AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.5)),
        ),
      ),
    );
  }

  // Animated Text
  Align animatedTextWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RotateAnimatedTextKit(
        alignment: Alignment.center,
        text: [
          this.splashTxt!,
          this.appName!,
          this.splashTxt!,
        ],
        textStyle: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
