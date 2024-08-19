// dining_data.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Restaurant {
  final String name;
  final String description;

  Restaurant({required this.name, required this.description});
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final Uuid _uuid = Uuid();

Future<void> addDiningData() async {
  final Map<String, List<Restaurant>> cityData = {
    'Islamabad': [
      Restaurant(
          name: 'Zamana Restaurant',
          description:
              'Located in Serena Hotel, Zamana offers a buffet with a mix of Pakistani and international dishes in a luxurious setting.'),
      Restaurant(
          name: 'Tuscany Courtyard',
          description:
              'An upscale Italian restaurant known for its authentic pasta, pizzas, and ambiance.'),
      Restaurant(
          name: 'Des Pardes',
          description:
              'A traditional Pakistani restaurant situated in Saidpur Village, offering a rustic dining experience with local cuisine.'),
      Restaurant(
          name: 'Chaaye Khana',
          description:
              'A cozy café popular for its tea, breakfast items, and relaxed atmosphere.'),
      Restaurant(
          name: 'Atrio Café & Grill',
          description:
              'Known for its rooftop dining and a menu featuring steaks, burgers, and pasta.'),
      Restaurant(
          name: 'Street 1 Café',
          description:
              'A chic café in Kohsar Market, offering a variety of international and Pakistani dishes.'),
      Restaurant(
          name: 'Burning Brownie',
          description:
              'Famous for its desserts, especially brownies and cheesecakes, along with a selection of savory items.'),
      Restaurant(
          name: 'Ox & Grill Steakhouse',
          description:
              'A steakhouse offering a range of grilled meats and seafood.'),
      Restaurant(
          name: 'Rakaposhi Café & Patisserie',
          description:
              'Located in Serena Hotel, it offers a mix of pastries, light meals, and gourmet coffee.'),
    ],
    'Lahore': [
      Restaurant(
          name: 'Cuckoo’s Den',
          description:
              'A historic restaurant near Badshahi Mosque, known for its traditional Pakistani cuisine and rooftop views.'),
      Restaurant(
          name: 'Andaaz Restaurant',
          description:
              'Offers a fine dining experience with a focus on Pakistani cuisine, located near Lahore Fort.'),
      Restaurant(
          name: 'Spice Bazaar',
          description:
              'An upscale restaurant specializing in a variety of Pakistani dishes.'),
      Restaurant(
          name: 'Haveli Restaurant',
          description:
              'A rooftop restaurant offering views of Badshahi Mosque and traditional cuisine.'),
      Restaurant(
          name: 'The Brasserie',
          description:
              'A modern bistro offering a fusion of international and Pakistani dishes.'),
      Restaurant(
          name: 'English Tea House',
          description:
              'Known for its English-style afternoon tea and a range of continental dishes.'),
      Restaurant(
          name: 'Gai’a Japanese Fusion',
          description:
              'Offers a blend of Japanese cuisine with modern twists.'),
      Restaurant(
          name: 'Yum Chinese and Thai',
          description:
              'Specializes in Chinese and Thai cuisine with a stylish ambiance.'),
      Restaurant(
          name: 'Arcadian Café',
          description:
              'A trendy café offering a mix of international and local dishes.'),
      Restaurant(
          name: 'Freddy’s Café',
          description:
              'Known for its diverse menu and chic setting, offering a mix of continental and Pakistani food.'),
    ],
    'Karachi': [
      Restaurant(
          name: 'Kolachi Restaurant',
          description:
              'A seaside restaurant offering a variety of Pakistani and continental dishes with stunning views.'),
      Restaurant(
          name: 'BBQ Tonight',
          description:
              'Famous for its extensive barbecue menu and lively atmosphere.'),
      Restaurant(
          name: 'Xander’s',
          description:
              'A trendy café known for its gourmet sandwiches, pastas, and salads.'),
      Restaurant(
          name: 'Sakura',
          description:
              'A high-end Japanese restaurant located in the Pearl Continental Hotel.'),
      Restaurant(
          name: 'Café Flo',
          description: 'Offers French cuisine with a sophisticated ambiance.'),
      Restaurant(
          name: 'Okra',
          description:
              'Known for its Mediterranean dishes and fine dining experience.'),
      Restaurant(
          name: 'Lal Qila',
          description:
              'A themed restaurant offering a buffet of Pakistani and Mughlai cuisine.'),
      Restaurant(
          name: 'Kababjees',
          description:
              'Popular for its diverse barbecue menu and family-friendly environment.'),
      Restaurant(
          name: 'Fuchsia',
          description: 'Specializes in contemporary Thai cuisine.'),
      Restaurant(
          name: 'The Deli',
          description:
              'A stylish café offering a mix of international dishes and gourmet coffee.'),
    ],
    'Peshawar': [
      Restaurant(
          name: 'Namak Mandi',
          description:
              'Famous for its traditional Pashtun cuisine, especially the lamb karahi.'),
      Restaurant(
          name: 'Charsi Tikka',
          description:
              'Renowned for its mouth-watering tikka and traditional seating arrangement.'),
      Restaurant(
          name: 'Shiraz Ronaq',
          description:
              'Offers a variety of Pakistani dishes in a family-friendly environment.'),
      Restaurant(
          name: 'Chief Burger',
          description:
              'Popular fast-food spot known for its burgers and sandwiches.'),
      Restaurant(
          name: 'Shelton’s Rezidor',
          description:
              'An upscale restaurant offering a mix of local and international cuisine.'),
      Restaurant(
          name: 'Habibi Restaurant',
          description: 'Known for its traditional Pashtun and Afghan dishes.'),
      Restaurant(
          name: 'Tatara Restaurant',
          description:
              'Offers a diverse menu with a focus on Pakistani cuisine.'),
      Restaurant(
          name: 'Chief’s',
          description:
              'A popular dining spot for fast food and Pakistani dishes.'),
      Restaurant(
          name: 'Pizza Hut',
          description:
              'Well-known international pizza chain offering a variety of pizzas and sides.'),
      Restaurant(
          name: 'Usmania Restaurant',
          description:
              'Offers a wide range of Pakistani dishes in a traditional setting.'),
    ],
    'Quetta': [
      Restaurant(
          name: 'Lehri Sajji House',
          description: 'Famous for its Balochi sajji and traditional cuisine.'),
      Restaurant(
          name: 'Café Baldia',
          description: 'Offers a variety of Pakistani dishes and fast food.'),
      Restaurant(
          name: 'Usmania Tandoor',
          description:
              'Known for its freshly baked bread and traditional dishes.'),
      Restaurant(
          name: 'Bloomstar Restaurant',
          description: 'Offers a mix of Pakistani and continental cuisine.'),
      Restaurant(
          name: 'Green Hotel',
          description: 'Known for its traditional Balochi and Afghan dishes.'),
      Restaurant(
          name: 'Millennium Restaurant',
          description:
              'Offers a variety of Pakistani dishes in a family-friendly environment.'),
      Restaurant(
          name: 'Sufi Restaurant',
          description: 'Specializes in traditional Pakistani cuisine.'),
      Restaurant(
          name: 'Jan Broast',
          description: 'Popular for its broasted chicken and fast food items.'),
      Restaurant(
          name: 'Quetta Serena Hotel’s Ziarat Terrace',
          description:
              'Offers fine dining with a mix of local and international dishes.'),
      Restaurant(
          name: 'Tandoor Restaurant',
          description:
              'Known for its traditional Balochi dishes and fresh bread.'),
    ],
    'Multan': [
      Restaurant(
          name: 'Café Aylanto',
          description:
              'Offers a mix of continental and Italian dishes in an elegant setting.'),
      Restaurant(
          name: 'Bundu Khan',
          description:
              'Famous for its barbecue and traditional Pakistani cuisine.'),
      Restaurant(
          name: 'Shangrilla Cuisine',
          description: 'Offers a variety of Pakistani and Chinese dishes.'),
      Restaurant(
          name: 'Hardee’s',
          description:
              'Popular fast-food chain known for its burgers and sandwiches.'),
      Restaurant(
          name: 'Pizza Hut',
          description:
              'International pizza chain offering a variety of pizzas and sides.'),
      Restaurant(
          name: 'Salt ‘n Pepper',
          description: 'Offers a mix of Pakistani and continental dishes.'),
      Restaurant(
          name: 'Khan Baba Restaurant',
          description: 'Known for its traditional Pakistani cuisine.'),
      Restaurant(
          name: 'Tandoori Restaurant',
          description: 'Offers a variety of barbecue and traditional dishes.'),
      Restaurant(
          name: 'Al-Maida',
          description: 'Popular for its pizzas, burgers, and fast food items.'),
      Restaurant(
          name: 'Shahjahan Grill',
          description:
              'Offers a mix of Pakistani and continental dishes in a stylish setting.'),
    ],
  };

  for (var city in cityData.keys) {
    for (var restaurant in cityData[city]!) {
      final String restaurantId = _uuid.v4();
      await _firestore
          .collection('city')
          .doc(city)
          .collection('topdiningplaces')
          .doc(restaurantId)
          .set({
        'restaurantName': restaurant.name,
        'restaurantDescription': restaurant.description,
        'restaurantId': restaurantId,
        'restaurantCity': city,
        'restaurantReviews': [], // Initialize as an empty list
      });
    }
  }
}
