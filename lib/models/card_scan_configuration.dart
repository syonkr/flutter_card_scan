class CardScanConfiguration {

  // for IOS prefiexs
  List<String> prefixesRegional = ["9"];

  // for IOS UI Customize
  String scanCardString = "Scan Card";
  String positionCardString = "Position your card in the frame so the card number is visible";
  String backButtonString = "Back";
  String skipButtonString = "Enter card manually";
  String denyPermissionTitleString = "Need camera access";
  String denyPermissionMessageString = "Please enable camera access in your settings to scan your card";
  String denyPermissionButtonString = "OK";

  CardScanConfiguration({
    this.scanCardString = "Scan Card",
    this.positionCardString = "Position your card in the frame so the card number is visible",
    this.backButtonString = "Back",
    this.skipButtonString = "Enter card manually",
    this.denyPermissionTitleString = "Need camera access",
    this.denyPermissionMessageString = "Please enable camera access in your settings to scan your card",
    this.denyPermissionButtonString = "OK",
    this.prefixesRegional = const ["9"],
  });

  CardScanConfiguration.fromMap(Map<Object?, Object?> map) {
    if (map['scanCardString'] != null) {
      scanCardString = map['scanCardString'] as String;
    }
    if (map['positionCardString'] != null) {
      positionCardString = map['positionCardString'] as String;
    }
    if (map['backButtonString'] != null) {
      backButtonString = map['backButtonString'] as String;
    }
    if (map['skipButtonString'] != null) {
      skipButtonString = map['skipButtonString'] as String;
    }
    if (map['denyPermissionTitleString'] != null) {
      denyPermissionTitleString = map['denyPermissionTitleString'] as String;
    }
    if (map['denyPermissionMessageString'] != null) {
      denyPermissionMessageString = map['denyPermissionMessageString'] as String;
    }
    if (map['denyPermissionButtonString'] != null) {
      denyPermissionButtonString = map['denyPermissionButtonString'] as String;
    }
    if (map['prefixesRegional'] != null) {
      prefixesRegional = (map['prefixesRegional'] as String).split(",");
    }
  }

  Map<String, String> get map => {
    'scanCardString': scanCardString,
    'positionCardString': positionCardString,
    'backButtonString': backButtonString,
    'skipButtonString': skipButtonString,
    'denyPermissionTitleString': denyPermissionTitleString,
    'denyPermissionMessageString': denyPermissionMessageString,
    'denyPermissionButtonString': denyPermissionButtonString,
    'prefixesRegional': prefixesRegional.join(", "),
  };
}