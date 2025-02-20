//orderlistitem.dart

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../common/widgets/rounded_container.dart';


class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => SizedBox(height: 16),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(16),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row -1
            Row(
              children: [
                /// 1-Icon
                Icon(Iconsax.ship),
                SizedBox(width: 8),

                /// 2 - Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.blue, fontWeightDelta: 1),
                      ),
                      Text(
                        '17 Jan 2025',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),

                /// 3 -Icon
                IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Iconsax.arrow_right_3,
                      size: 16,
                    ))
              ],
            ),
            SizedBox(
              height: 16,
            ),

            /// Row -2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1-Icon
                      Icon(Iconsax.tag),
                      SizedBox(width: 8),

                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '[#134se]',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// 1-Icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: 8),

                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '23 Jan 2025',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}