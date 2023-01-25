import 'package:flutter/material.dart';

import '../models/gritem.dart';

// ignore: must_be_immutable
class ItemSummary extends StatelessWidget {
  List<GrItem> groceries;
  double weight = 0.0;
  ItemSummary(this.groceries, {super.key});

  double get totalWeight {
    var totalWt = 0.0;
    for (var i = 0; i < groceries.length; i++) {
      if (groceries[i].itemUnits == 'Kg') {
        totalWt += groceries[i].itemQty;
      }
      if (groceries[i].itemUnits == 'Gms') {
        totalWt += groceries[i].itemQty * 0.001;
      }
      if (groceries[i].itemUnits == 'l') {
        totalWt += groceries[i].itemQty;
      }
      if (groceries[i].itemUnits == 'Nos') {
        totalWt += groceries[i].itemQty * 0.15;
      }
    }
    return totalWt;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).backgroundColor,
        child: Row(
          children: [
            const Flexible(
                flex: 1, fit: FlexFit.tight, child: Text('Item Count :')),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Text('${groceries.length}')),
            const Flexible(
                flex: 1, fit: FlexFit.tight, child: Text('Approx Weight :')),
            Flexible(flex: 1, fit: FlexFit.tight, child: Text('$totalWeight')),
          ],
        ));
  }
}
