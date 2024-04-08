import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Pallete.kWhiteColor,
      ),
      child: FlutterCarousel(
        items: [
          Image.asset(
            'assets/images/plant_care3.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/plant_care4.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/call_doct1.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/call_doct2.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/call_doct3.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/call_doct4.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/talk_people.jpg',
            width: MediaQuery.of(context).size.width,
          ),
        ],
        options: CarouselOptions(
          height: 150,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(seconds: 1),
        )),
    );
  }
}
