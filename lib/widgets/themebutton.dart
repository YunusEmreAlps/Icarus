// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:icarus/helpers/appcolors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemeButton extends StatelessWidget {
  String? label;
  Function onClick;
  Color color;
  Color? highlight;
  Widget? icon;
  Color borderColor;
  Color labelColor;
  double borderWidth;

  ThemeButton(
      {this.label,
      this.labelColor = Colors.white,
      this.color = AppColors.MAIN_COLOR,
      this.highlight = AppColors.HIGHTLIGHT_DEFAULT,
      this.icon,
      this.borderColor = Colors.transparent,
      this.borderWidth = 4,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: this.color,
          child: InkWell(
            splashColor: this.highlight,
            highlightColor: this.highlight,
            onTap: () {
              this.onClick();
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: this.borderColor, width: this.borderWidth),
              ),
              child: (this.icon == null)
                  ? Text(
                      this.label!,
                      style: TextStyle(
                          fontSize: 16,
                          color: this.labelColor,
                          fontWeight: FontWeight.bold),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        this.icon!,
                        SizedBox(width: 10),
                        Text(
                          this.label!,
                          style: TextStyle(
                              fontSize: 16,
                              color: this.labelColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
