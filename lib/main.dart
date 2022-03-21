// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/pages/detailspage.dart';
import 'package:icarus/pages/mainpage.dart';
import 'package:icarus/pages/mappage.dart';
import 'package:icarus/pages/onboardingpage.dart';
import 'package:icarus/pages/selectedcategorypage.dart';
import 'package:icarus/pages/splashpage.dart';
import 'package:icarus/pages/welcomepage.dart';
import 'package:icarus/services/cartservice.dart';
import 'package:icarus/services/categoryselectionservice.dart';
import 'package:icarus/services/categoryservice.dart';
import 'package:icarus/services/loginservice.dart';
import 'package:icarus/pages/loginsuccess.dart';
import 'package:icarus/pages/donationpage.dart';
import 'helpers/utils.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginService()
        ),
        ChangeNotifierProvider(
          create: (_) => CategorySelectionService()
        ),
        ChangeNotifierProvider(
          create: (_) => CartService()
        ),
        Provider(
          create: (_) => CategoryService()
        )
      ],
      child: MaterialApp(
        navigatorKey: Utils.mainAppNav,
        theme: ThemeData(fontFamily: 'Raleway',),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: '/onboardingpage'), // /welcomepage
          '/welcomepage': (context) => WelcomePage(),
          '/mainpage': (context) => MainPage(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
          '/mappage': (context) => MapPage(),
          '/onboardingpage': (context) => OnboardingPage(),
          '/loginsuccesspage': (context) => LoginSuccessPage(),
        },
        
      )
    )
  );
}



