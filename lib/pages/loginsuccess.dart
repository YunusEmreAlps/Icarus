// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'dart:async';
import 'package:icarus/helpers/appcolors.dart';
import 'package:icarus/helpers/iconhelper.dart';
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/models/onboardingcontent.dart';
import 'package:icarus/pages/categorylistpage.dart';
import 'package:icarus/widgets/iconfont.dart';
import 'package:icarus/widgets/mainappbar.dart';
import 'package:icarus/widgets/themebutton.dart';

class LoginSuccessPage extends StatefulWidget {
  @override
  _LoginSuccessPageState createState() => _LoginSuccessPageState();
}

class _LoginSuccessPageState extends State<LoginSuccessPage> {
  // Page Routing
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => goToHome(context));
  }

  static void goToHome(BuildContext context) {
    Navigator.popAndPushNamed(context, '/mainpage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              // Success Image
              Image.asset(
                "assets/imgs/success.png",
                height: 360,
              ),
              SizedBox(height: 30),
              Text(
                "Login Success",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
