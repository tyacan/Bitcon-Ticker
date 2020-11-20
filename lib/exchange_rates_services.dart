import 'networking_service.dart';

class ExchangeRates {
  Future<dynamic> getBTCToUSD() async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';

    NetworkHelper networkHelper = NetworkHelper(url);
    var btcToUsd = await networkHelper.getData();
    return btcToUsd;
  }
  Future<dynamic> getBTC() async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';

    NetworkHelper networkHelper = NetworkHelper(url);
    var btcToUsd = await networkHelper.getData();
    return btcToUsd;
  }
  Future<dynamic> getETH() async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/ETH/USD';

    NetworkHelper networkHelper = NetworkHelper(url);
    var btcToUsd = await networkHelper.getData();
    return btcToUsd;
  }
  Future<dynamic> getLTC() async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/LTC/USD';

    NetworkHelper networkHelper = NetworkHelper(url);
    var btcToUsd = await networkHelper.getData();
    return btcToUsd;
  }
}
