package com.syonkr.flutter_card_scan

import android.app.Activity
import android.content.Context
import android.view.WindowManager
import androidx.annotation.NonNull
import androidx.activity.ComponentActivity
import com.stripe.android.stripecardscan.cardscan.CardScanSheet
import com.stripe.android.stripecardscan.cardscan.CardScanSheetResult
import com.stripe.android.stripecardscan.payment.card.CardIssuer
import com.stripe.android.stripecardscan.payment.card.supportCardIssuer
import com.syonkr.flutter_card_scan.models.CardInfo
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterCardScanPlugin */
class FlutterCardScanPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel : MethodChannel
    private var activity: Activity? = null
    private var context : Context? = null
    private var scanResult : Result? = null
    private lateinit var cardScanSheet : CardScanSheet

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_card_scan")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
//        com.stripe.android.stripecardscan.cardscan.framework.Config.displayLogo = false
        // korean card issuer add
        supportCardIssuer(900000..999999, CardIssuer.Custom("KOREAN_LOCAL"), (14..16).toList(), listOf(3))
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        scanResult = result
        if (call.method == "scanCard") {
            // Because this activity displays card numbers, disallow screenshots.
            activity?.window?.setFlags(
                WindowManager.LayoutParams.FLAG_SECURE,
                WindowManager.LayoutParams.FLAG_SECURE
            )
//            cardScanSheet.present(
//                enableEnterManually = false,
//                enableNameExtraction = true,
//                enableExpiryExtraction = true
//            )

            cardScanSheet.present()

            } else if (call.method == "configuration") {
                // TODO prefixesRegional
            } else {
                result.notImplemented()
            }
        }

        private fun handleScanResult(result: CardScanSheetResult) {
            activity?.window?.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
            when (result) {
                is CardScanSheetResult.Completed -> scanResult?.success(CardInfo(
                        cardNumber = result.scannedCard.pan ?: "",
                        cardHolderName = "",
                        expiryYear = "",
                        expiryMonth = "",
                    ).dictionary())
                is CardScanSheetResult.Canceled -> scanResult?.success(null)
                is CardScanSheetResult.Failed -> scanResult?.success(null)
            }
        }

        override fun onAttachedToActivity(binding: ActivityPluginBinding) {
            activity = binding.activity
            cardScanSheet = CardScanSheet.create(
                from = activity as ComponentActivity,
                cardScanSheetResultCallback = ::handleScanResult
            )
        }

        override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
            channel.setMethodCallHandler(null)
            context = null
        }

        override fun onDetachedFromActivityForConfigChanges() {}

        override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

        override fun onDetachedFromActivity() {}
    }
