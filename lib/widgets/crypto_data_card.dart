import 'package:crypto_app/crypto_currency.dart';
import 'package:flutter/material.dart';

import '../crypto_currency.dart';

class CryptoDataCard extends StatelessWidget {
  final CryptoCurrency cryptoCurrency;

  CryptoDataCard(this.cryptoCurrency);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          cryptoCurrency.symbol,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      title: Text(
        cryptoCurrency.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '%(1h):  ${cryptoCurrency.percentChange1h.toStringAsFixed(5)}',
        style: TextStyle(
          color: cryptoCurrency.percentChange1h > 0 ? Colors.green : Colors.red,
        ),
      ),
      trailing: Text(
        '\$${cryptoCurrency.price.toStringAsFixed(5)}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
