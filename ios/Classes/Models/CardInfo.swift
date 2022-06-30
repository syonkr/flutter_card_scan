import Foundation

public class CardInfo: CustomStringConvertible {
    var cardNumber = ""
    var cardHolderName = ""
    var expiryYear = ""
    var expiryMonth = ""
    
    init(cardNumber: String = "", cardHolderName: String = "", expiryYear: String = "", expiryMonth: String = "") {
        self.cardNumber = cardNumber
        self.cardHolderName = cardHolderName
        self.expiryYear = expiryYear
        self.expiryMonth = expiryMonth
    }
    
    init(from options: [String: String]?) {
        if let options = options {
            if let cardNumber = options["cardNumber"] {
                self.cardNumber = cardNumber
            }
            
            if let cardHolderName = options["cardHolderName"] {
                self.cardHolderName = cardHolderName
            }
            
            if let expiryYear = options["expiryYear"] {
                self.expiryYear = expiryYear
            }
            
            if let expiryMonth = options["expiryMonth"] {
                self.expiryMonth = expiryMonth
            }
        }
    }
    
    public var description: String {
        return """
        Card Number: \(cardNumber)
        Card Holder Name: \(cardHolderName)
        Expiry Year: \(expiryYear)
        Expiry Month: \(expiryMonth)
        """
    }
    
    var dictionary: [String: String] {
        return [
            "cardNumber": cardNumber,
            "cardHolderName": cardHolderName,
            "expiryYear": expiryYear,
            "expiryMonth": expiryMonth,
        ]
    }
}
