
import 'package:bite_bliss/screens/order/widgets/order_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed:(){Navigator.pushNamed(context, AppRoutes.home);},
          // Add your navigation logic here, for example:

          icon: Icon(
            Icons.arrow_left,
            size: 16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: OrderListItems(),
      ),

      /// Orders24
    );
  }
}