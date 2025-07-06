String createGooglePaymentConfig({
  required String gateway,
  required String gatewayMerchantId,
  required String merchantId,
  required String merchantName,
  required String environment,
  required String currencyCode,
  required String countryCode,
}) {
  return '''{
        "provider": "google_pay",
        "data": {
            "environment": "$environment",
            "apiVersion": 2,
            "apiVersionMinor": 0,
            "allowedPaymentMethods": [
                {
                    "type": "CARD",
                    "tokenizationSpecification": {
                        "type": "PAYMENT_GATEWAY",
                        "parameters": {
                            "gateway": "$gateway",
                            "gatewayMerchantId": "$gatewayMerchantId"
                        }
                    },
                    "parameters": {
                        "allowedCardNetworks": [
                            "VISA",
                            "MASTERCARD"
                        ],
                        "allowedAuthMethods": [
                            "PAN_ONLY",
                            "CRYPTOGRAM_3DS"
                        ],
                        "billingAddressRequired": true,
                        "billingAddressParameters": {
                            "format": "FULL",
                            "phoneNumberRequired": true
                        }
                    }
                }
            ],
            "merchantInfo": {
                "merchantId": "$merchantId",
                "merchantName": "$merchantName"
            },
            "transactionInfo": {
                "countryCode": "$countryCode",
                "currencyCode": "$currencyCode"
            }
        }
    }''';
}
