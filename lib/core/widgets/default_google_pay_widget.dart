import 'package:clean_arch_flutter/core/widgets/defaultGooglePayment.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePayWidget extends StatelessWidget {
  final double totalPrice;
  final EdgeInsets? margin;
  const GooglePayWidget({super.key, required this.totalPrice, this.margin});

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(createGooglePaymentConfig(
        gateway: 'adyen',
        gatewayMerchantId: 'gatewayMerchantId',
        merchantId: '01234567890123456789',
        merchantName: 'Azzrk',
        environment: 'TEST',
        currencyCode: 'EGP',
        countryCode: 'EG',
      )),
      paymentItems: [
        PaymentItem(
          label: 'Total',
          amount: totalPrice.toString(),
          status: PaymentItemStatus.final_price,
        ),
      ],
      margin: margin ?? EdgeInsets.zero,
      type: GooglePayButtonType.buy,
      theme: GooglePayButtonTheme.light,
      onPaymentResult: (result) => debugPrint(result.toString()),
      width: double.maxFinite,
      loadingIndicator: CircularProgressIndicator(),
    );
  }
}
