import 'package:bitcoin_ticker/exchange_rates_services.dart';
import 'package:flutter/cupertino.dart';

import 'coin_data.dart';
import 'package:flutter/material.dart';
import 'dart:io' as Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  ExchangeRates exchangeRates = ExchangeRates();
  String selectedItem = 'USD';
  String selectedItemValue = '?';
  String selectedItemBTC = '?';
  String selectedItemETH = '?';
  String selectedItemLTC = '?';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> items = [];
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

    return DropdownButton<String>(
      value: selectedItem,
      // Solution byMuathye;
      // items: currenciesList.map((currency) {
      //   return DropdownMenuItem(
      //     child: new Text(currency.toString()),
      //     value: currency,
      //   );
      // }).toList(),
      items: items,
      onChanged: (value) {
        setState(() {
          selectedItem = value;
          changeRate();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
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

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        changeRate();
      },
      children: items,
    );
  }

  @override
  void initState() {
    super.initState();
    changeRate();
  }

  void changeRate() async {
    dynamic value = await exchangeRates.getBTCToUSD();
    dynamic valueBTC = await exchangeRates.getBTC();
    dynamic valueETH = await exchangeRates.getETH();
    dynamic valueLTC = await exchangeRates.getLTC();
    setState(() {
      selectedItemValue = value['rate'].toString();
      selectedItemBTC = valueBTC['rate'].toString();
      selectedItemETH = valueETH['rate'].toString();
      selectedItemLTC = valueLTC['rate'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $selectedItemBTC $selectedItem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $selectedItemETH $selectedItem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $selectedItemLTC $selectedItem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
