import 'package:flutter/cupertino.dart';

import 'coin_data.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedItem = 'USD';

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> getDropdownItems() {
      List<DropdownMenuItem> items = [];
      // for (int i = 0; i < currenciesList.length; i++) {
      //   String currency = currenciesList[i];
      //   var newItem = DropdownMenuItem(
      //     child: Text(currency),
      //     value: currency,
      //   );
      //   items.add(newItem);
      // }
      for (String currency in currenciesList) {
        var newItem = DropdownMenuItem(
          child: Text(currency),
          value: currency,
        );
        items.add(newItem);
      }
      return items;
    }

    List<Widget> getPickerItems() {
      List<Widget> items = [];
      for (String currency in currenciesList) {
        var newItem = Text(
          currency,
          style: TextStyle(
            fontSize: 36,
            color: Colors.white,
          ),
        );
        items.add(newItem);
      }
      return items;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
                backgroundColor: Colors.lightBlue,
                itemExtent: 32.0,
                onSelectedItemChanged: (selectedIndex) {},
                children: getPickerItems()),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String>(
//                 value: selectedItem,
//                 // Solution byMuathye;
//                 // items: currenciesList.map((currency) {
//                 //   return DropdownMenuItem(
//                 //     child: new Text(currency.toString()),
//                 //     value: currency,
//                 //   );
//                 // }).toList(),
//                 items: getDropdownItems(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedItem = value;
//                   });
//                 })
