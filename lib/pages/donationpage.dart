// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'dart:async';
import 'package:icarus/helpers/appcolors.dart';
import 'package:icarus/helpers/iconhelper.dart';
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/models/category.dart';
import 'package:icarus/models/onboardingcontent.dart';
import 'package:icarus/pages/categorylistpage.dart';
import 'package:icarus/widgets/categorycard.dart';
import 'package:icarus/widgets/iconfont.dart';
import 'package:icarus/widgets/mainappbar.dart';
import 'package:icarus/widgets/themebutton.dart';

class DonationPage extends StatelessWidget {
  List<Category> donationCategories = [
    Category(
      name: "Food",
      icon: "a",
      color: AppColors.MAIN_COLOR,
      imgName: "cat3",
    ),
    // For us, admins, persons
    Category(
        name: "Money",
        icon: "a",
        color: AppColors.MAIN_COLOR,
        imgName: "dcat4",
        subCategories: [
          Category(name: "For us", icon: "", color: AppColors.DARKER_GREEN, imgName: ""),
          Category(name: "Admins", icon: "", color: AppColors.DARKER_GREEN, imgName: ""),
          Category(name: "For us", icon: "", color: AppColors.DARKER_GREEN, imgName: ""),
        ]),
    // Dog, Cat, Cow, Chicken
    Category(
      name: "Pet Food",
      icon: "a",
      color: AppColors.MAIN_COLOR,
      imgName: "dcat3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Select a donation type:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: donationCategories.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryCard(
                      category: donationCategories[index],
                      onCardClick: () {
                        if(donationCategories[index].subCategories != null){

                        }
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )
    ]));
  }
}
