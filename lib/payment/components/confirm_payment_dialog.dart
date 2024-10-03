import 'package:flutter/material.dart';
import 'package:food_delivery_app/delivery_progress/screens/receipt_page.dart';

class ConfirmPaymentDialog extends StatelessWidget {
  const ConfirmPaymentDialog({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirm payment',
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text("Card number : $cardNumber"),
            Text("Expiry date : $expiryDate"),
            Text("Card holder name : $cardHolderName"),
            Text("CVV : $cvvCode"),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);

              Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeliveryProgressPage(),
                        ),
                        (route) => false,
                      );
            },
            child: Text("Pay"))
      ],
    );
  }
}
