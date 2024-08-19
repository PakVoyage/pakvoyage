import 'package:flutter/material.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class CityCard extends StatelessWidget {
  const CityCard(
      {super.key,
      required this.cityName,
      required this.placeName,
      required this.placeImage,
      this.isCity});
  final String cityName;
  final String placeName;
  final String placeImage;
  final bool? isCity;

  @override
  Widget build(BuildContext context) {
    // Taking devices width
    // double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12),
      height: 180,
      width: 190,
      decoration: BoxDecoration(
          color: Colors.black38, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isCity == true
              ? Text(
                  cityName,
                  style: StyledTheme.styledFonts
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placeName,
                      style: StyledTheme.styledFonts
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 13,
                          color: Colors.white,
                        ),
                        Text(
                          cityName,
                          style: StyledTheme.styledFonts.copyWith(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ],
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
