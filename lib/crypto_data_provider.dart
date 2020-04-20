import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './crypto_currency.dart';

const url =
    'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';

class CryptoDataProvider with ChangeNotifier {
  List<CryptoCurrency> _cryptoData = [];

  List<CryptoCurrency> get cryptoData {
    return [..._cryptoData];
  }

  Future<void> fetchAndSetData() async {
    final response = await http.get(
      url,
      headers: {
        'Accepts': 'application/json',
        'X-CMC_PRO_API_KEY': 'YOUR-API-KEY(MINE WAS COINMARKETCAP BASIC)',
      },
    );

    final cryptoCurrencies =
        json.decode(response.body)['data'] as List<dynamic>;

    _cryptoData = cryptoCurrencies.map((currency) {
      return CryptoCurrency(
        name: currency['name'],
        symbol: currency['symbol'],
        price: currency['quote']['USD']['price'],
        percentChange1h: currency['quote']['USD']['percent_change_1h'],
      );
    }).toList();
    notifyListeners();
  }
}
