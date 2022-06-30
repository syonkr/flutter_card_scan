import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_card_scan/flutter_card_scan.dart';
import 'package:flutter_card_scan/models/card_info.dart';
import 'package:flutter_card_scan/models/card_scan_configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _cardNumber = '';
  String? _cardHolderName;
  int? _expiryYear;
  int? _expiryMonth;
  String _status = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanCard() async {
    FlutterCardScan.setConfiguration(configuration: CardScanConfiguration(
      scanCardString: "카드 스캔",
      positionCardString: "화면의 틀안에 카드를 맞춰주세요.",
      prefixesRegional: ['9'],
    ));

    CardInfo? cardInfo = await FlutterCardScan.scanCard();
    print(cardInfo);

    if (!mounted) return;

    setState(() {
      _status = cardInfo != null ? 'SUCCESS' : 'CANCELED';
      _cardNumber = cardInfo?.cardNumber ?? '';
      _cardHolderName = cardInfo?.cardHolderName;
      _expiryYear = cardInfo?.expiryYear;
      _expiryMonth = cardInfo?.expiryMonth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () async {
                  await scanCard();
                },
                child: Text('Running'),
              ),
              Text('status = $_status'),
              Text('cardNumber = $_cardNumber'),
              Text('cardHolderName = $_cardHolderName'),
              Text('expiryYear = $_expiryYear'),
              Text('expiryMonth = $_expiryMonth'),
            ],
          ),
        ),
      ),
    );
  }
}
