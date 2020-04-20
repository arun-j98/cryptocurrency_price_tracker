import 'package:crypto_app/crypto_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CryptoDataProvider(),
      child: MaterialApp(
        title: 'CryptoData',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
