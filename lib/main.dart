
import 'package:bite_bliss/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/location/location_bloc.dart';
import 'blocs/recent_products/recent_products_bloc.dart';
import 'providers/product_data.dart';
import 'providers/cart_provider.dart';
import 'providers/wishlist_provider.dart';
import 'routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProxyProvider<WishlistProvider, ProductsData>(
          create: (context) => ProductsData(Provider.of<WishlistProvider>(context, listen: false)),
          update: (context, wishlistProvider, previousProductsData) =>
              ProductsData(wishlistProvider),
        ),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        Provider<LocationBloc>(
          create: (context) => LocationBloc(),
          dispose: (context, bloc) => bloc.close(),
        ),
        Provider<RecentProductsBloc>(
          create: (context) => RecentProductsBloc(),
          dispose: (context, bloc) => bloc.close(),
        ),
      ],
      child: MaterialApp(
        title: 'Tasty Treat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFFFE0000),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFE0000),
            primary: const Color(0xFFFE0000),
          ),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFE0000),
              foregroundColor: Colors.white,
            ),
          ),
        ),
        initialRoute: AppRoutes.initial,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
