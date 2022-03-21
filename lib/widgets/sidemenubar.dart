// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/helpers/appcolors.dart';
import 'package:icarus/helpers/iconhelper.dart';
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/services/categoryselectionservice.dart';
import 'package:icarus/services/categoryservice.dart';
import 'package:icarus/services/loginservice.dart';
import 'package:icarus/widgets/iconfont.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    CategoryService categoryService =
        Provider.of<CategoryService>(context, listen: false);

    bool userLoggedIn = loginService.loggedInUserModel != null;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        color: AppColors.MAIN_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextButton(
                    onPressed: () async {
                      if (userLoggedIn) {
                        await loginService.signOut();
                        categoryService.resetCategoriesToDefaults();
                        Utils.mainAppNav.currentState!
                            .pushReplacementNamed('/welcomepage');
                      } else {
                        bool success = await loginService.signInWithGoogle();
                        if (success) {
                          Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                        }
                      }
                    },
                    child: Row(
                      children: [
                        Icon(userLoggedIn ? Icons.logout : Icons.login,
                            color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text(userLoggedIn ? 'Logout' : 'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    )),
                SizedBox(height: 10),
                Visibility(
                  visible: !userLoggedIn,
                  child: TextButton(
                    onPressed: () async {
                      Utils.mainAppNav.currentState!.pushNamed('/welcomepage');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.home, color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text('Logout',
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                  ),
                ),
                // Icarus Action Button
                TextButton(
                  onPressed: () async {
                    launch("https://linkuppinfo.netlify.app/");
                  },
                  child: Row(
                    children: [
                      Icon(Icons.workspaces_outline,
                          color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Icarus Action',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                // Donation
                TextButton(
                  onPressed: () async {
                    Utils.mainListNav.currentState!.pushReplacementNamed('/mainpage/donationspage');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add_reaction_sharp,
                          color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Feed It Forward',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                // Voice
                TextButton(
                  onPressed: () async {
                    Utils.mainListNav.currentState!.pushReplacementNamed('/mainpage/assistantpage');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_voice_outlined,
                          color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Icarus Help',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                )
              
              ],
            ),
            IconFont(
                iconName: IconFontHelper.LOGO, size: 70, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
