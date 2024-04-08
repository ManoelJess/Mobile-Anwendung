import 'package:bookmytime/screens/announcementInfos_screen.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class AnnounceCard extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final String image;
  final double imageHeight;
  final String location;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String grobDesc;
  final String creatorId;
  final Color cardColor;
  const AnnounceCard({
    Key? key,
    this.width = 50,
    this.height = 55,
    this.color = Pallete.whiteColor,
    this.shadowColor = Pallete.kGreyColor,
    this.image = 'assets/images/help.png',
    this.imageHeight = 100,
    required this.location,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.grobDesc,
    required this.creatorId,
    required this.cardColor,
  }) : super(key: key);

  @override
  _AnnounceCardState createState() => _AnnounceCardState();
}

class _AnnounceCardState extends State<AnnounceCard> {
  // to control with change icon color
  bool _isFavorited = false;
  // to determine the starting point number
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  double heigt = 0;
  bool handy = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 6.3,
      decoration: BoxDecoration(
        color: widget.cardColor,
        //color: widget.color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Image.asset(
                widget.image,
                height: 50,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text('${widget.location}',
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: AutofillHints.addressCity,
                    fontWeight: FontWeight.w400,
                    color: Pallete.blackColor),
                textAlign: TextAlign.left),
            const SizedBox(
              height: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Description : ${widget.description}',
                    style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Pallete.blackColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      iconSize: 13,
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      icon: (_isFavorited
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border)),
                      color: Colors.red[500],
                      onPressed: _toggleFavorite,
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    IconButton(
                      iconSize: 13,
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.chat_bubble),
                      color: Pallete.kGreenColor,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnnouncementInfosScreen(
                              creatorId: widget.creatorId,
                              subject: widget.description,
                              description: widget.grobDesc,
                              startTime: widget.startTime,
                              endTime: widget.endTime,
                              location: widget.location,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
