/*
* Orders are going to be sent in from backend server.
* Order class has fields for time, volume, type, purchaser, and price.
*/
class Order {
  String _time; // Time the trade was executed.
  String
      _volume; // #Of contracts, or shares purchased // Specifies whether the trades are puts or calls if options, and buy or sells if stocks.
  String
      _purchaser; // Usually unknown, set to null if case. Set to insider if applicable.
  int _price; // In $Million1.
  bool _alertUser; // If true then send push notification to user.

  Order(
      {String time,
      String volume,
      String purchaser,
      int price,
      bool alertUser}) {
    this._time = time;
    this._volume = volume;
    this._purchaser = purchaser;
    this._price = price;
    this._alertUser = alertUser;
  }

  String getTime() {
    return _time;
  }

  String getVolume() {
    return _volume;
  }

  String getPurchaser() {
    return _purchaser;
  }

  int getPrice() {
    return _price;
  }

  bool willAlertUser() {
    return _alertUser;
  }

  void setPurchaser(String purchaser) {
    this._purchaser = purchaser;
  }

  void changeAlertUser(bool alert) {
    this._alertUser = alert;
  }
}

class Option extends Order {
  bool _call; // True if the option order is a call.
  bool _buy; // True if this was a option buy order.
  int _strikePrice;

  Option(String time, String volume, String purchaser, int price,
      bool alertUser, bool call, bool buy, int strikePrice)
      : super(
            time: time,
            volume: volume,
            purchaser: purchaser,
            price: price,
            alertUser: alertUser) {
    this._call = call;
    this._buy = buy;
    this._strikePrice = strikePrice;
  }

  bool isCall() {
    return _call;
  }

  bool isBuy() {
    return _buy;
  }

  int getStrikePrice() {
    return _strikePrice;
  }
}

class Stock extends Order {
  Stock(String time, String volume, String purchaser, int price, bool alertUser,
      bool call, bool buy, int strikePrice)
      : super(time: time, volume: volume, purchaser: purchaser, price: price) {}
}
