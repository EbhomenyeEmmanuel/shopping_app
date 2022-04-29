import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/cart/cart_provider.dart';
import 'package:shopping_app/screens/favorites/favorite_provider.dart';
import 'package:shopping_app/screens/favorites/favorite_screen.dart';
import 'package:shopping_app/screens/home/home_provider.dart';
import 'package:shopping_app/screens/home/home_screen_widget.dart';
import 'package:shopping_app/screens/cart/cart_screen.dart';
import 'package:shopping_app/screens/tab_manager.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TabManager()),
    ChangeNotifierProvider(create: (context) => FavoriteProvider()),
    ChangeNotifierProxyProvider<FavoriteProvider, HomeProvider>(
      create: (context) => HomeProvider(),
      update: (BuildContext context, favoriteProvider,
              HomeProvider? homeProvider) =>
          homeProvider!..update(favoriteProvider),
    ),
    ChangeNotifierProvider(create: (context) => ShoppingCartProvider()),
  ], child: const ShoppingApp()));
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static List<Widget> pages = <Widget>[
    const HomeScreenWidget(),
    const FavoriteScreen(),
    const CartScreen(),
    Container(
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
        builder: (context, tabManager, child) => Scaffold(
              body: pages[tabManager.selectedTab],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.deepOrangeAccent,
                unselectedItemColor: Colors.grey.withOpacity(0.5),
                selectedIconTheme:
                    const IconThemeData(color: Colors.deepOrangeAccent),
                unselectedIconTheme:
                    IconThemeData(color: Colors.grey.withOpacity(0.4)),
                showUnselectedLabels: false,
                currentIndex: tabManager.selectedTab,
                onTap: (index) {
                  tabManager.goToTab(index);
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favourites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ));
  }
}
