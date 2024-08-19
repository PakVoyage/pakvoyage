import 'package:flutter/material.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class TravelTipsScreen extends StatelessWidget {
  const TravelTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Tips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text.rich(
            TextSpan(
              text: '',
              style: StyledTheme.styledFonts.copyWith(color: Colors.black),
              children: const [
                TextSpan(
                  text: 'Travel Tips for Local Pakistani Travelers\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '1. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Know Your Destinations',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Familiarize yourself with the culture and history of the places you plan to visit.\n',
                ),
                TextSpan(
                  text: '2. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Seasonal Considerations',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ': Check the weather forecast and pack accordingly.\n',
                ),
                TextSpan(
                  text: '3. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Local Cuisine',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Enjoy local dishes from hygienic establishments; be cautious with street food.\n',
                ),
                TextSpan(
                  text: '4. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Travel Documentation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ': Always carry your CNIC identification with you.\n',
                ),
                TextSpan(
                  text: '5. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Transportation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Book long-distance tickets in advance and use ride-hailing apps in urban areas.\n',
                ),
                TextSpan(
                  text: '6. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Health Precautions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Carry a basic first aid kit, stay hydrated, and be mindful of altitude sickness in higher regions.\n',
                ),
                TextSpan(
                  text: '7. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Respect Local Customs',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Dress modestly and adhere to local traditions and norms.\n\n',
                ),
                TextSpan(
                  text: 'Travel Tips for Foreign Tourists in Pakistan\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '1. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Visa and Documentation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Ensure you have a valid visa and necessary permits; keep photocopies of your passport and visa.\n',
                ),
                TextSpan(
                  text: '2. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Cultural Sensitivity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Dress modestly and respect local customs and traditions.\n',
                ),
                TextSpan(
                  text: '3. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Language Basics',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Learning a few Urdu phrases can be helpful for communication.\n',
                ),
                TextSpan(
                  text: '4. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Safety and Security',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Stay informed about regional security updates, register with your embassy, and keep emergency contacts accessible.\n',
                ),
                TextSpan(
                  text: '5. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Health Precautions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Obtain required vaccinations, drink bottled water, and dine at reputable restaurants.\n',
                ),
                TextSpan(
                  text: '6. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Currency and Transactions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Use Pakistani Rupees; carry cash for rural areas and exchange money at authorized centers.\n',
                ),
                TextSpan(
                  text: '7. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Transportation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Utilize reliable travel agencies, ride-hailing services in cities, and established bus or flight services for intercity travel.\n',
                ),
                TextSpan(
                  text: '8. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Cultural Experiences',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Explore historical sites, enjoy local music and festivals, and engage with locals.\n',
                ),
                TextSpan(
                  text: '9. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Emergency Contacts',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Keep a list of emergency contacts, and download offline maps and travel guides.\n',
                ),
                TextSpan(
                  text: '10. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Local SIM Card',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Purchase a local SIM card for better connectivity.\n',
                ),
                TextSpan(
                  text: '11. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Travel Light',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ': Pack only essential items to avoid carrying heavy luggage.\n',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
