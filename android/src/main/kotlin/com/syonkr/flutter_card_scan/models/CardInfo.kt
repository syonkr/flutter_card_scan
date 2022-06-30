package com.syonkr.flutter_card_scan.models

data class CardInfo (
    val cardNumber: String,
    val cardHolderName: String?,
    val expiryYear: String?,
    val expiryMonth: String?,
) {
    fun dictionary(): Map<String, String> {
        val map = mutableMapOf<String, String>()
        map["cardNumber"] = cardNumber
        if (cardHolderName != null) {
            map["cardHolderName"] = cardHolderName
        }
        if (expiryYear != null) {
            map["expiryYear"] = expiryYear
        }
        if (expiryMonth != null) {
            map["expiryMonth"] = expiryMonth
        }
        return map.toMap()
    }
}

fun CardInfo.toUserView(): Map<String, String> {
    val map = mutableMapOf<String, String>()
    map["cardNumber"] = cardNumber
    if (cardHolderName != null) {
        map["cardHolderName"] = cardHolderName
    }
    if (expiryYear != null) {
        map["expiryYear"] = expiryYear
    }
    if (expiryMonth != null) {
        map["expiryMonth"] = expiryMonth
    }
    return map.toMap()
}