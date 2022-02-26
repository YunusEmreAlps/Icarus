// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:icarus/helpers/appcolors.dart';
import 'package:icarus/helpers/iconhelper.dart';
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/widgets/userprofileheader.dart';
import 'iconfont.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {

  Color themeColor;
  bool showProfilePic;

  MainAppBar({ 
    this.themeColor = AppColors.MAIN_COLOR,
    this.showProfilePic = true  
  });

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {

  @override 
  Widget build(BuildContext context) {
    return AppBar(
        title: GestureDetector(
          onTap: () {
            Utils.mainAppNav.currentState!.popUntil((route) => route.settings.name == '/mainpage');
          },
          child: Center(
            child: IconFont(
            iconName: IconFontHelper.LOGO,
              color: widget.themeColor,
              size: 40
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: widget.themeColor),
        actions: [
          UserProfileHeader(
            showProfilePic: widget.showProfilePic,
          )
        ],
      );
  }
}
