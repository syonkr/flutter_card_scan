import Flutter
import UIKit
import CardScan

public class SwiftFlutterCardScanPlugin: UIViewController, FlutterPlugin {
  var mainResult:FlutterResult?
  var cardScanConfiguration = CardScanConfiguration()
  static var apiKey = "SP-wehkNs6BHT7aVv-ASxAH5YuTyEXX6"
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_card_scan", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterCardScanPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    ScanViewController.configure(apiKey: apiKey);
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      self.mainResult = result
      if(call.method.elementsEqual("scanCard")){
          CreditCardUtils.prefixesRegional = cardScanConfiguration.prefixesRegional
          guard let vc = ScanViewController.createViewController(withDelegate: self) else {
              print("scan view controller not supported on this hardware")
              result(nil);
              return
          }
          vc.stringDataSource = self
          
          UIApplication.shared.keyWindow?.rootViewController?.present(
              vc,
              animated: true,
              completion: nil
          )
      } else if(call.method.elementsEqual("configuration")){
          cardScanConfiguration.setConfiguration(from: call.arguments as? [String: String])
      } else {
          result(FlutterMethodNotImplemented);
      }
  }
}

extension SwiftFlutterCardScanPlugin: FullScanStringsDataSource {
    public func scanCard() -> String { return cardScanConfiguration.scanCardString }
    public func positionCard() -> String { return cardScanConfiguration.positionCardString }
    public func backButton() -> String { return cardScanConfiguration.backButtonString }
    public func skipButton() -> String { return cardScanConfiguration.skipButtonString }
    public func denyPermissionTitle() -> String { return cardScanConfiguration.denyPermissionTitleString }
    public func denyPermissionMessage() -> String { return cardScanConfiguration.denyPermissionMessageString }
    public func denyPermissionButton() -> String { return cardScanConfiguration.denyPermissionButtonString }
}

extension SwiftFlutterCardScanPlugin: ScanDelegate {
   public func userDidSkip(_ scanViewController: ScanViewController) {
       self.mainResult?(nil)
       UIApplication.shared.keyWindow?.rootViewController?.dismiss(
           animated: true,
           completion: nil
       )
    }
    
    public func userDidCancel(_ scanViewController: ScanViewController) {
        self.mainResult?(nil)
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(
            animated: true,
            completion: nil
        )
    }
    
    public func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
        let cardInfo = CardInfo(
            cardNumber: creditCard.number,
            cardHolderName: creditCard.name ?? "",
            expiryYear: creditCard.expiryYear ?? "",
            expiryMonth: creditCard.expiryMonth ?? ""
        )
        self.mainResult?(cardInfo.dictionary)
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(
            animated: true,
            completion: nil
        )
    }
    
    public func userDidScanQrCode(_ scanViewController: ScanViewController, payload: String) {
        self.mainResult?(nil)
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(
            animated: true,
            completion: nil
        )
    }
}
