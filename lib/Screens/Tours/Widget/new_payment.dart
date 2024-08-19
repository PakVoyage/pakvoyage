import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Home/Ui/bottom_bar.dart';
import 'package:pak_voyage/Screens/Tours/Provider/tour_provider.dart';
import 'package:pak_voyage/Utils/card_colors.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class MySample extends StatefulWidget {
  const MySample({
    super.key,
    required this.name,
    required this.details,
    required this.date,
    required this.route,
    required this.img,
    required this.tourId,
  });
  final String name;
  final String details;
  final String date;
  final String route;
  final String img;
  final String tourId;
  @override
  State<StatefulWidget> createState() => MySampleState();
}

class MySampleState extends State<MySample> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TourProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CreditCardWidget(
              enableFloatingCard: useFloatingAnimation,
              glassmorphismConfig: _getGlassmorphismConfig(),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'Axis Bank',
              frontCardBorder:
                  useGlassMorphism ? null : Border.all(color: Colors.grey),
              backCardBorder:
                  useGlassMorphism ? null : Border.all(color: Colors.grey),
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: isLightTheme
                  ? AppColors.cardBgLightColor
                  : AppColors.cardBgColor,
              backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      inputConfiguration: const InputConfiguration(
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: InputDecoration(
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          labelText: 'Card Holder',
                        ),
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Total: ${provider.tourPrice} PKR",
                      style: StyledTheme.styledFonts.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: _onValidate,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: Text(
                          'Validate',
                          style: StyledTheme.styledFonts
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onValidate() async {
    if (formKey.currentState?.validate() ?? false) {
      showDialog(
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(.5),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green[300],
                        size: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Payment Successfull",
                        style: StyledTheme.styledFonts
                            .copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
      final provider = Provider.of<TourProvider>(context, listen: false);

      var id = Uuid().v4();
      FirebaseServices.firestore.collection('mytrips').doc().set({
        'name': widget.name,
        'details': widget.details.toString(),
        'date': widget.date.toString(),
        "route": widget.route.toString(),
        'price': provider.tourPrice.toString(),
        'img': widget.img.toString(),
        'id': id,
        'userId': FirebaseServices.userDetail.id
      });
      await FirebaseServices.getUserDetail();
      Future.delayed(Duration(seconds: 2), () async {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomBar(),
            ));
      });
// Add Tours in Current User collection
      FirebaseServices.firestore
          .collection('users')
          .doc(FirebaseServices.userDetail.id)
          .update({
        'myTours': FieldValue.arrayUnion([widget.tourId])
      });
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) {
      return null;
    }

    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
      stops: const <double>[0.3, 0],
    );

    return isLightTheme
        ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
        : Glassmorphism.defaultConfig();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
