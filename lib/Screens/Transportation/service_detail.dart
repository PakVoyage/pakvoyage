import 'package:flutter/material.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails(
      {super.key,
      this.name,
      this.description,
      this.booking,
      this.routes,
      this.options,
      required this.transportPic});
  final String? name;
  final String? description;
  final String? booking;
  final String transportPic;
  final List<dynamic>? routes;
  final List<dynamic>? options;

  @override
  Widget build(BuildContext context) {
    String formattedOptions = options!.join(', ');
    String formattedRoutes = routes!.join(', ');
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.asset(transportPic),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name ?? '',
              style: StyledTheme.styledFonts.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Description: ',
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Text(
              description ?? '',
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Booking: ',
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Text(
              booking ?? '',
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Routes: ',
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Text(
              formattedRoutes,
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Options: ',
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Text(
              formattedOptions,
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
