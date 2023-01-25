import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewItem extends StatefulWidget {
  Function newitadd;
  NewItem(this.newitadd, {super.key});

  static const List<String> list = <String>['Kg', 'Gms', 'Nos', "l"];

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  String dropdownValue = NewItem.list.first;

  final itemTextcntrl = TextEditingController();

  final itemQtycntrl = TextEditingController();

  final itemUnitscntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Item'),
              controller: itemTextcntrl,
              keyboardType: TextInputType.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  // height: 20,
                  width: MediaQuery.of(context).size.width * .75,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Qty'),
                    controller: itemQtycntrl,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    alignment: AlignmentDirectional.center,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    elevation: 16,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: NewItem.list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: (() => widget.newitadd(itemTextcntrl.text,
                  int.parse(itemQtycntrl.text), dropdownValue)),
              child: const Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
