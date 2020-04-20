import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/crypto_data_card.dart';
import './crypto_data_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _init = true;

  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<CryptoDataProvider>(context, listen: false).fetchAndSetData();
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CryptoData',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Consumer<CryptoDataProvider>(
            child: Center(child: CircularProgressIndicator()),
            builder: (ctx, cryptoData, ch) => cryptoData.cryptoData.length <= 0
                ? ch
                : ListView.builder(
                    itemCount: cryptoData.cryptoData.length,
                    itemBuilder: (ctx, i) => Column(
                      children: <Widget>[
                        CryptoDataCard(cryptoData.cryptoData[i]),
                        Divider(),
                      ],
                    ),
                  ),
          )),
      // ),
    );
  }
}
