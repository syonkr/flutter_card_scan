class CardInfo {
  String _cardNumber = '';
  String? _cardHolderName;
  int? _expiryYear;
  int? _expiryMonth;

  CardInfo.fromMap(Map<Object?, Object?> map) {
    _cardNumber = map['cardNumber'] as String? ?? '';
    if (map['cardHolderName'] != null) {
      _cardHolderName = map['cardHolderName'] as String;
    }
    if (map['expiryYear'] != null) {
      _expiryYear = int.parse(map['expiryYear']! as String);
    }
    if (map['expiryMonth'] != null) {
      _expiryMonth = int.parse(map['expiryMonth'] as String);
    }
  }

  Map<String, Object> get map => {
    'cardNumber': _cardNumber,
    if (_cardHolderName != null) 'cardHolderName': _cardHolderName!,
    if (_expiryYear != null) 'expiryYear': _expiryYear!,
    if (_expiryMonth != null) 'expiryMonth': _expiryMonth!,
  };

  String get cardNumber => _cardNumber;
  String? get cardHolderName => _cardHolderName;
  int? get expiryYear => _expiryYear;
  int? get expiryMonth => _expiryMonth;

  @override
  String toString() {
    var string = '';
    string += cardNumber.isEmpty ? "" : 'Card Number = $cardNumber\n';
    string += cardHolderName?.isEmpty ?? true ? "" : 'Card Holder = $cardHolderName\n';
    string += expiryYear == null ? "" : 'expiryYear = $expiryYear\n';
    string += expiryMonth == null ? "" : 'expiryMonth = $expiryMonth\n';
    return string;
  }
}