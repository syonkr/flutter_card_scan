import Foundation

public class CardScanConfiguration {
    var scanCardString = "Scan Card"
    var positionCardString = "Position your card in the frame so the card number is visible"
    var backButtonString = "Back"
    var skipButtonString = "Enter card manually"
    var denyPermissionTitleString = "Need camera access"
    var denyPermissionMessageString = "Please enable camera access in your settings to scan your card"
    var denyPermissionButtonString = "OK"
    var prefixesRegional = ["9"]
      
    init() {}
    
    public func setConfiguration(from options: [String: String]?) {
        if let options = options {
            if options["scanCardString"] != nil {
                scanCardString = options["scanCardString"] ?? ""
            }
            if options["positionCardString"] != nil {
                positionCardString = options["positionCardString"] ?? ""
            }
            if options["backButtonString"] != nil {
                backButtonString = options["backButtonString"] ?? ""
            }
            if options["skipButtonString"] != nil {
                skipButtonString = options["skipButtonString"] ?? ""
            }
            if options["denyPermissionTitleString"] != nil {
                denyPermissionTitleString = options["denyPermissionTitleString"] ?? ""
            }
            if options["denyPermissionMessageString"] != nil {
                denyPermissionMessageString = options["denyPermissionMessageString"] ?? ""
            }
            if options["denyPermissionButtonString"] != nil {
                denyPermissionButtonString = options["denyPermissionButtonString"] ?? ""
            }
            if options["prefixesRegional"] != nil {
                prefixesRegional = (options["prefixesRegional"] ?? "").components(separatedBy: ",")
            }
        }
    }
}
