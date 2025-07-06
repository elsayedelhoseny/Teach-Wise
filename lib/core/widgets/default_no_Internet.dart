import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

Widget noInternet(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/nointernet.gif',
            height: 150,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              getLocalizedText(context).noInternetconnection,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              getLocalizedText(context).checkyourconnection,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
