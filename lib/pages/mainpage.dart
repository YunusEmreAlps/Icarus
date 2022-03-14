// Flutter imports:
import 'package:flutter/material.dart';
import 'package:icarus/pages/donationpage.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/pages/categorylistpage.dart';
import 'package:icarus/pages/favoritespage.dart';
import 'package:icarus/pages/settingspage.dart';
import 'package:icarus/pages/shoppinglistpage.dart';
import 'package:icarus/services/cartservice.dart';
import 'package:icarus/widgets/categorybottombar.dart';
import 'package:icarus/widgets/mainappbar.dart';
import 'package:icarus/widgets/sidemenubar.dart';
import 'package:icarus/helpers/appcolors.dart';

class MainPage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    CartService cartService = Provider.of<CartService>(context, listen: false);
    cartService.loadCartItemsFromFirebase(context);

    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar()
      ),
      appBar: MainAppBar(),
      body: Container(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Navigator(
                    key: Utils.mainListNav,
                    initialRoute: '/',
                    onGenerateRoute: (RouteSettings settings) {

                      Widget page;

                      switch(settings.name) {
                        case '/':
                          page = CategoryListPage();
                          break;
                        case '/mainpage/favoritespage':
                          page = FavoritesPage();
                          break;
                        case '/mainpage/shoppinglistpage':
                          page = ShoppingListPage();
                          break;
                        case '/mainpage/settingspage':
                          page = SettingsPage();
                          break;
                        case '/mainpage/donationspage':
                          page = DonationPage();
                          break;
                        default:
                          page = CategoryListPage();
                          break;
                      }

                      return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => page,
                        transitionDuration: const Duration(seconds: 0)
                      );
                    },
                  )
                ),
                CategoryBottomBar()
              ],
            )
      ),
    );
  }
}
