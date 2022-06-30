import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_card_scan/models/card_info.dart';
import 'models/card_scan_configuration.dart';

class FlutterCardScan {
  static const MethodChannel _channel = MethodChannel('flutter_card_scan');

  static Future<CardInfo?> scanCard() async {
    final result = await _channel.invokeMethod('scanCard');
    if (result != null) return CardInfo.fromMap(result);
    return null;
  }

  static void setConfiguration({required CardScanConfiguration configuration}) {
    _channel.invokeMethod('configuration', configuration.map);
  }
}
