import 'package:flutter/material.dart';
import '../models/gritem.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  Function deleteIt;
  List<GrItem> groceries;

  ItemList(this.groceries, this.deleteIt, {super.key});

  @override
  Widget build(BuildContext context) {
    return groceries.isEmpty ?
    Column(
            children: <Widget>[
              Text(
                'No Items added yet !',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.5,
                  child: Image.asset('assets/images/cart.jpeg',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        :
    ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                      '${groceries[index].itemQty}\n${groceries[index].itemUnits}'),
                ),
              ),
            ),
            title: Text(
              groceries[index].itemText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(groceries[index].itemDate!),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => deleteIt(groceries[index].itemDate),
            ),
          ),
        );
      },
      itemCount: groceries.length,
    );
  }
}
