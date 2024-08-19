import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uuid/uuid.dart';

final List<Map<String, dynamic>> tourss = [
  // Azad Kashmir Tours
  {
    'location': 'Azad Kashmir',
    'tours': [
      {
        'name': '5 Days Azad Kashmir Arang Kel Taobat Tour Package',
        'imgUrl':
            'assets/images/tours images/Azad Kashmir/5 Days Azad Kashmir Arang Kel Taobat Tour Package.jpg',
        'duration': '5 Days 4 Nights',
        'availability': 'June - October',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '64,000 PKR',
        'details':
            'Azad Kashmir is abundant in tourists from the ancient Buddhist University’s remains in Sharda. Each with unparalleled beauty and significance. Surrounded by nature, freshwater lakes and beautiful mountain peaks, you would not want to depart this mesmerizing place. So, listen to the melodious chirping of the birds and enjoy your holidays & vacation trips in peace. The surreal vibe of the Neelum Valley Azad Kashmir plan will leave you mesmerized. It’s also a hiker’s paradise owing to its unexplored natural bounty. The village isn’t too common among travelers yet so that one can enjoy the scenic beauty in calm and peaceful tours.',
        'days': 5,
        'array': ''
      },
      {
        'name': '3 Days Neelum Valley Arang Kel Sharda Tour Package',
        'imgUrl':
            'assets/images/tours images/Azad Kashmir/3 Days Neelum Valley Arang Kel Sharda Tour Package.jpg',
        'duration': '3 Days 2 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '46,000 PKR',
        'details':
            'Azad Kashmir is abundant in tourists from the ancient Buddhist University’s remains in Sharda. Each with unparalleled beauty and significance. Surrounded by nature, freshwater lakes and beautiful mountain peaks, you would not want to depart this mesmerizing place. So, listen to the melodious chirping of the birds and enjoy your holidays & vacation trips in peace. The surreal vibe of the Neelum Valley Azad Kashmir plan will leave you mesmerized. It’s also a hiker’s paradise owing to its unexplored natural bounty. The village isn’t too common among travelers yet so that one can enjoy the scenic beauty in calm and peaceful tours.',
        'days': 3,
        'array': ''
      },
      {
        'name': '3 Days Travel Package to Azad Kashmir Pakistan',
        'imgUrl':
            'assets/images/tours images/Azad Kashmir/3 Days Travel Package to Azad Kashmir Pakistan.jpg',
        'duration': '3 Days 2 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Islamabad - Karachi',
        'price': '46,000 PKR',
        'details':
            'Azad Kashmir is abundant in tourists from the ancient Buddhist University’s remains in Sharda. Each with unparalleled beauty and significance. Surrounded by nature, freshwater lakes, and beautiful mountain peaks, you would not want to depart this mesmerizing place. So, listen to the melodious chirping of the birds and enjoy your holidays & vacation trips in peace. The surreal vibe of the Neelum Valley Azad Kashmir plan will leave you mesmerized. It’s also a hiker’s paradise owing to its unexplored natural bounty. The village isn’t too common among travelers yet so one can enjoy the scenic beauty in calm and peaceful Northern Areas of Pakistan Tour Packages.',
        'days': 3,
        'array': ''
      }
    ]
  },
  // Chitral Tours
  {
    'location': 'Chitral',
    'tours': [
      {
        'name': 'Choimus Winter Festival in Kalash',
        'imgUrl':
            'assets/images/tours images/Chitral/Choimus Winter Festival in Kalash.jpg',
        'duration': '4 Days 3 Nights',
        'availability': 'December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '28,500 PKR',
        'details':
            'Kalash Winter festival is also called “Choimus” in the local language. This annually observed event symbolizes and forecasts the village’s and its people’s prosperity in the coming year. During the festival, People go out to seek foxes which are considered good omens. Torch-lit processions arrive from nearby villages at the main traditional dancing place called a “Charsue.” The dancing and festivities are held indoors late into the night as the local wine is handed around the bonfire. The locals perform rituals for purification during the festival at the dawn of the new year. The tribal elders gather at hilltops to watch the rising sun of the new year, followed by goat sacrifices made to the Goddess, “Jastak,” and the blood is sprinkled at the temple Jastarkhan. We believe that visiting Kalash valley and experiencing the “Kalash festival” will create a lifelong memory that will stay with you for a long time.',
        'days': 4,
        'array': ''
      },
      {
        'name': 'Uchal Summer Festival in Kalash',
        'imgUrl':
            'assets/images/tours images/Chitral/Uchal Summer Festival in Kalash.jpg',
        'duration': '4 Days 3 Nights',
        'availability': 'August - September',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '28,500 PKR',
        'details':
            'People of Kalash celebrate the arrival of summer in their own way. Summer festival is very popular among the Kalasha people. In recent years, this festival has also gained popularity all round the world. People from different part of Pakistan and international tourist attend the summer festival in large numbers. During the festival, Kalasha People pay homage to their God by celebrating the harvest and also thanking their God for blessing them with good food and crops. Kalash people take a procession to a high plateau outside the village in Balangkuru and pray to their God, after the prayers the night long dance and party begins which last until the early hours in the morning. Summer festival is celebrated in all the valleys for several days.',
        'days': 4,
        'array': ''
      },
      {
        'name': 'Chilam Joshi Festival Dates 2023 Kalash Valley',
        'imgUrl':
            'assets/images/tours images/Chitral/Chilam Joshi Festival Kalash-Valley.jpg',
        'duration': '4 Days 3 Nights',
        'availability': 'May',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '27,500 PKR',
        'details':
            'Spring festival is also known as the Chilam Joshi festival. People of Kalash celebrate four days across all Kalash valleys. Spring festival begins with “Milk day”. Ten days prior to the festival, they store milk from their households. People of Kalash offer their libation during this event. The festival reflects their unique cultural richness, the harmony in their society and message of peace to the world. They ask for blessing from their God and pray for a prosperous year of agriculture and health and safety of their herds. During this festival, Kalashi men and women also choose their life patterns. During the Kalash festival Women wear traditional attire with lively colors and their dresses have patterns of flowers on it. They sing traditional songs and dance. They offer prayers and then celebrate with wine, which is prepared from raisins. Kalash people offer sacrifices of sheep and goat on the fourth day of the festival.',
        'days': 4,
        'array': ''
      }
    ]
  },
  // Hunza Tours
  {
    'location': 'Hunza',
    'tours': [
      {
        'name': '5 Days Hunza & Khunjerab Pass Tour',
        'imgUrl':
            'assets/images/tours images/hunza/5 days hunza & khunjerab pass tours.jpg',
        'duration': '5 Days 4 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '110,000 PKR',
        'details':
            'Hunza Valley is a high mountain valley located in the Gilgit-Baltistan region of Pakistan. The valley is known for its stunning scenery and is a popular tourist destination. The Khunjerab Pass is a high mountain pass in the Karakoram Range and serves as a border crossing between Pakistan and China. This 5-day tour package offers a comprehensive exploration of the Hunza Valley and includes visits to various attractions such as the Baltit Fort, Altit Fort, and the beautiful Attabad Lake. The tour also includes a visit to the Khunjerab Pass, which is the highest paved international border crossing in the world.',
        'days': 5,
        'array': ''
      },
      {
        'name': '5 Days By Air Hunza Valley Family Trip',
        'imgUrl':
            'assets/images/tours images/hunza/5 days by air hunza valley family trip.jpg',
        'duration': '5 Days 4 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Islamabad - Karachi',
        'price': '72,500 PKR',
        'details':
            'This tour package is designed for families who want to experience the beauty of Hunza Valley with the convenience of air travel. The package includes flights to and from Hunza Valley, accommodation in comfortable hotels, and guided tours of the major attractions in the valley. Highlights of the tour include visits to the Baltit Fort, Altit Fort, and Attabad Lake, as well as a trip to the Khunjerab Pass. The tour is designed to provide a relaxing and enjoyable experience for families, with plenty of opportunities for sightseeing and leisure activities.',
        'days': 5,
        'array': ''
      },
      {
        'name': '5 Days Private Tour to Hunza and Naltar Valley',
        'imgUrl':
            'assets/images/tours images/hunza/5 Days Private Tour to Hunza and Naltar Valley.jpg',
        'duration': '5 Days 4 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '100,000 PKR',
        'details':
            'This private tour package offers a personalized experience of the Hunza and Naltar Valleys. The tour includes visits to the major attractions in Hunza Valley, such as Baltit Fort, Altit Fort, and Attabad Lake, as well as a trip to the beautiful Naltar Valley. The Naltar Valley is known for its lush green meadows, pine forests, and colorful lakes. The tour is designed to provide a relaxing and enjoyable experience, with plenty of opportunities for sightseeing and leisure activities.',
        'days': 5,
        'array': ''
      }
    ]
  },
  // Murree Tours
  {
    'location': 'Murree',
    'tours': [
      {
        'name': '3 Days Murree Romantic Couple Tour Package',
        'imgUrl':
            'assets/images/tours images/Muree/3 days murree romantic couple tour packages.jpg',
        'duration': '3 Days 2 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '33,000 PKR',
        'details':
            'This romantic tour package is perfect for couples looking to explore Murree and its surrounding areas. The package includes comfortable accommodation, guided tours of the main attractions, and special romantic experiences such as candlelight dinners and scenic views. Quick info: Tour Type: Romantic Couple Trip Route: Lahore – Islamabad – Murree Duration: 3 Days and 2 Nights Lahore Start point: PSO Fuel Station Thokar Niaz Baig Lahore Islamabad Start point: Daewoo Bus Terminal NUST Rawalpindi Karachi Start point: Pakistan Railway Station Cant / Faisal Movers Inclusions: Accommodation in Hotel as per the variant selected Breakfast and Dinner as mentioned in the variant Highly-Experienced Mountain Driver Services of Professional Guide Sightseeing as per itinerary All toll tax, parking, fuel and driver allowances All applicable taxes Comfortable and Sanitized vehicle (Coaster Saloon / Hi-Roof) for sightseeing on all days as per the itinerary',
        'days': 3,
        'array': ''
      },
      {
        'name': '4 Days Murree Nathia Gali Family Trip Package',
        'imgUrl':
            'assets/images/tours images/Muree/4 days muree nathia gali family trip package.jpg',
        'duration': '4 Days 3 Nights',
        'availability': 'All Year',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '56,000 PKR',
        'details':
            'This family-friendly tour package covers Murree and Nathia Gali, offering a blend of sightseeing and relaxation. The package includes accommodation, guided tours, and visits to local attractions. The itinerary is designed to provide an enjoyable experience for families. Quick info: Tour Type: Family Trip Route: Lahore – Islamabad – Murree – Nathia Gali Duration: 4 Days and 3 Nights Lahore Start point: PSO Fuel Station Thokar Niaz Baig Lahore Islamabad Start point: Daewoo Bus Terminal NUST Rawalpindi Karachi Start point: Pakistan Railway Station Cant / Faisal Movers Inclusions: Accommodation in Hotel as per the variant selected Breakfast and Dinner as mentioned in the variant Highly-Experienced Mountain Driver Services of Professional Guide Sightseeing as per itinerary All toll tax, parking, fuel and driver allowances All applicable taxes Comfortable and Sanitized vehicle (Coaster Saloon / Hi-Roof) for sightseeing on all days as per the itinerary',
        'days': 4,
        'array': ''
      },
      {
        'name': '3 Days Nathia Gali Honeymoon Travel Package',
        'imgUrl':
            'assets/images/tours images/Muree/3 days Nathia Gali honeymoon travel package.jpg',
        'duration': '3 Days 2 Nights',
        'availability': 'Whole Year',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '45,000 PKR',
        'details':
            'This honeymoon package is perfect for couples looking for a romantic getaway in Nathia Gali. The package includes luxury accommodation, guided tours, and special romantic experiences. Highlights include scenic views and relaxing activities. Quick info: Tour Type: Honeymoon Package Route: Lahore – Islamabad – Nathia Gali Duration: 3 Days and 2 Nights Lahore Start point: PSO Fuel Station Thokar Niaz Baig Lahore Islamabad Start point: Daewoo Bus Terminal NUST Rawalpindi Karachi Start point: Pakistan Railway Station Cant / Faisal Movers Inclusions: Accommodation in Hotel as per the variant selected Breakfast and Dinner as mentioned in the variant Highly-Experienced Mountain Driver Services of Professional Guide Sightseeing as per itinerary All toll tax, parking, fuel and driver allowances All applicable taxes Comfortable and Sanitized vehicle (Coaster Saloon / Hi-Roof) for sightseeing on all days as per the itinerary',
        'days': 3,
        'array': ''
      }
    ]
  },
  // Swat Tours
  {
    'location': 'Swat',
    'tours': [
      {
        'name': '5 Days Honeymoon Tour Package To Malam Jabba & Swat Kalam',
        'imgUrl':
            'assets/images/tours images/Swat/5 Days Honeymoon Tour Package To Malam Jabba & Swat Kalam.jpg',
        'duration': '5 Days 4 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '115,000 PKR',
        'details':
            'Malam Jabba is a Hill Station in the Hindu Kush mountain range nearly 40 km from Saidu Sharif in the Swat Valley of the Khyber Pakhtunkhwa province of Pakistan. It is 314 km from Islamabad and 51 km from Saidu Sharif Airport. Malam Jabba is home to the only ski resort in Pakistan. If you want to explore the beauty of Malam Jabba, this tour package is for you. Swat Kalam Malam Jabba tour packages for families from Lahore, Karachi, Islamabad, Rawalpindi, Multan, and Faisalabad are very famous among the honeymoon lovers of Pakistan. Many domestic tourists prefer to travel to Malam Jabba in December, January, February, and March for honeymoon tours because of snow and cold weather.',
        'days': 5,
        'array': ''
      },
      {
        'name': '3 Days Swat Valley Honeymoon Tour Package',
        'imgUrl':
            'assets/images/tours images/Swat/3 Days Swat Valley Honeymoon Tour Package.jpg',
        'duration': '3 Days 2 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '75,000 PKR',
        'details':
            'If you want to explore the beauty of the Swat Valley in less than a week, this tour package is for you. Swat Kalam tour packages for families from Lahore, Karachi, Islamabad, Rawalpindi, Multan, and Faisalabad are very famous among the honeymoon lovers of Pakistan. Many domestic tourists prefer to travel to Swat Kalam in December, January, February, and March for honeymoon tours because of snow and cold weather. Moreover, you can also book a Swat tour package from Karachi by air.',
        'days': 3,
        'array': ''
      },
      {
        'name': '5 Days Swat Tour Package for Honeymoon Couples',
        'imgUrl':
            'assets/images/tours images/Swat/5 Days Swat Tour Package for Honeymoon Couples.jpg',
        'duration': '5 Days 4 Nights',
        'availability': 'January - December',
        'route': 'Lahore - Karachi - Islamabad',
        'price': '115,000 PKR',
        'details':
            'Malam Jabba is a Hill Station in the Hindu Kush mountain range nearly 40 km from Saidu Sharif in the Swat Valley of the Khyber Pakhtunkhwa province of Pakistan. It is 314 km from Islamabad and 51 km from Saidu Sharif Airport. Malam Jabba is home to the only ski resort in Pakistan. If you want to explore the beauty of Malam Jabba, this tour package is for you. Swat Kalam Malam Jabba tour packages for families from Lahore, Karachi, Islamabad, Rawalpindi, Multan, and Faisalabad are very famous among the honeymoon lovers of Pakistan. Many domestic tourists prefer to travel to Malam Jabba in December, January, February, and March for honeymoon tours because of snow and cold weather.',
        'days': 5,
        'array': ''
      }
    ]
  }
];

Future<void> addToursToFirestore() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Uuid uuid = const Uuid();

  for (var locationData in tourss) {
    String location = locationData['location'];
    List<Map<String, dynamic>> tours = locationData['tours'];

    for (var tour in tours) {
      // Generate a unique ID for each tour
      String tourId = uuid.v4();

      // Add the tourId to the tour data
      tour['tourId'] = tourId;

      // Add the location to the tour data
      tour['location'] = location;

      // Add the tour data to Firestore
      await firestore.collection('tours').doc(tourId).set(tour);
    }
  }
}
