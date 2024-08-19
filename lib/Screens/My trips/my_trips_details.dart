import 'package:flutter/material.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class MyTripsDetails extends StatelessWidget {
  const MyTripsDetails({
    super.key,
    required this.name,
    required this.img,
    required this.duration,
    required this.route,
    required this.price,
    required this.details,
  });
  final String name;
  final String img;
  final String duration;
  final String route;
  final String price;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Trips Details",
          style: StyledTheme.styledFonts.copyWith(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    details,
                    style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        duration,
                        style: StyledTheme.styledFonts.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.flight),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        route,
                        style: StyledTheme.styledFonts.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.money_sharp,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${price} PKR",
                        style: StyledTheme.styledFonts.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
