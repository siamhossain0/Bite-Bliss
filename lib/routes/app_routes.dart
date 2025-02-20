
import 'package:flutter/material.dart';
import '../pages/beverage_page.dart';
import '../pages/bread_page.dart';
import '../pages/cake_page.dart';
import '../pages/combo_meal.dart';
import '../pages/cookies_page.dart';
import '../pages/dessert_page.dart';
import '../pages/fast_food_page.dart';
import '../pages/pastry_page.dart';
import '../screens/cart_screen.dart';
import '../screens/category_screen.dart';
import '../screens/order/order_list.dart';
import '../screens/profile_screen.dart';
import '../screens/search_page.dart';

import '../screens/wishlist_page.dart';
import '../splash_screen/splash_screen.dart';
import '../screens/location_screen.dart';
import '../screens/home_screen.dart';
// Import the category pages

class AppRoutes {
  // Route names
  static const String initial = '/';
  static const String location = '/location';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String search = '/search';
  static const String category = '/category';
  static const String profile = '/profile';
  static const String wishlist = '/wishlist';
  static const String order ='/order';


  // Category routes
  static const String cakesPage = '/cakes';
  static const String pastryPage = '/pastry';
  static const String fastFoodPage = '/fast_food';
  static const String dessertPage = '/dessert';
  static const String breadPage = '/bread';
  static const String beveragePage = '/beverage';
  static const String cookiesPage = '/cookies';
  static const String comboMealPage = '/combo_meal';


  // Route map
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initial: (context) => const SplashScreen(),
      location: (context) => const LocationScreen(),
      home: (context) => const HomeScreen(),
      cart: (context) => const CartScreen(),
      search: (context) => const SearchPage(),
      category: (context) => CategoryScreen(),
      profile: (context) => const ProfileScreen(),
      wishlist: (context) => const WishlistScreen(),
      order: (context)=> const OrderScreen(),

      // Category pages
      cakesPage: (context) => const CakesPage(),
      pastryPage: (context) => const PastryPage(),
      fastFoodPage: (context) => const FastFoodPage(),
      dessertPage: (context) => const DessertPage(),
      breadPage: (context) => const BreadPage(),
      beveragePage: (context) => const BeveragePage(),
      cookiesPage: (context) => const CookiesPage(),
      comboMealPage: (context) => const ComboMealPage(),
    };
  }

  // Navigation methods
  static void goToLocation(BuildContext context) {
    Navigator.pushReplacementNamed(context, location);
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, home);
  }

  static void goToCart(BuildContext context) {
    Navigator.pushNamed(context, cart);
  }

  static void goToSearch(BuildContext context) {
    Navigator.pushNamed(context, search);
  }

  static void goToCategory(BuildContext context) {
    Navigator.pushNamed(context, category);
  }

  static void goToProfile(BuildContext context) {
    Navigator.pushNamed(context, profile);
  }

  // Category navigation methods
  static void goToCakes(BuildContext context) {
    Navigator.pushNamed(context, cakesPage);
  }

  static void goToPastry(BuildContext context) {
    Navigator.pushNamed(context, pastryPage);
  }

  static void goToFastFood(BuildContext context) {
    Navigator.pushNamed(context, fastFoodPage);
  }

  static void goToDessert(BuildContext context) {
    Navigator.pushNamed(context, dessertPage);
  }

  static void goToBread(BuildContext context) {
    Navigator.pushNamed(context, breadPage);
  }

  static void goToBeverage(BuildContext context) {
    Navigator.pushNamed(context, beveragePage);
  }

  static void goToCookies(BuildContext context) {
    Navigator.pushNamed(context, cookiesPage);
  }

  static void goToComboMeal(BuildContext context) {
    Navigator.pushNamed(context, comboMealPage);
  }
  static void goToWishlist(BuildContext context) {
    Navigator.pushNamed(context, wishlist);
  }
  static void goToOrderScreen(BuildContext context){
    Navigator.pushNamed(context, order);
  }


}
