import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Tours/Provider/tour_provider.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

void showAddCardDialog(
    BuildContext context, String name, details, date, route, img) {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final provider = Provider.of<TourProvider>(context, listen: false);

  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(.5)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Add New Card',
                        style: StyledTheme.styledFonts.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 16),
                    TextFormField(
                      style: StyledTheme.styledFonts.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(19), // Up to 19 digits
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Card Number',
                        hintStyle: StyledTheme.styledFonts.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                      height: 0,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: cardHolderController,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: StyledTheme.styledFonts.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                      height: 0,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4), // CVV length
                            ],
                            decoration: InputDecoration(
                              hintText: 'CVV',
                              hintStyle: StyledTheme.styledFonts.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: expiryDateController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(
                                  5), // MM/YY format
                            ],
                            decoration: InputDecoration(
                              hintText: 'MM/YY',
                              hintStyle: StyledTheme.styledFonts.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                      height: 0,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Total: ${provider.tourPrice}",
                          style: StyledTheme.styledFonts.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle card addition logic here
                            final cardNumber = cardNumberController.text;
                            final cardHolder = cardHolderController.text;
                            final expiryDate = expiryDateController.text;
                            final cvv = cvvController.text;

                            // Print or use the collected data
                            print('Card Number: $cardNumber');
                            print('Cardholder Name: $cardHolder');
                            print('Expiry Date: $expiryDate');
                            print('CVV: $cvv');
                            var id = Uuid().v4();
                            FirebaseServices.firestore
                                .collection('mytrips')
                                .doc()
                                .set({
                              'name': name,
                              'details': details.toString(),
                              'date': date.toString(),
                              "route": route.toString(),
                              'price': provider.tourPrice.toString(),
                              'img': img.toString(),
                              'id': id,
                              'userId': FirebaseServices.userDetail.id
                            });

                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Add Card'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
