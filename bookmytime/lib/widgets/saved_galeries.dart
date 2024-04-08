import 'package:bookmytime/models/galerie_modell.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class SavedGaleries extends StatefulWidget {
  const SavedGaleries({Key? key}) : super(key: key);

  @override
  _nearbyDoctors createState() => _nearbyDoctors();
}

class _nearbyDoctors extends State<SavedGaleries>
    with TickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: galeries.length,
              physics: BouncingScrollPhysics(),
              controller: PageController(initialPage: 3, viewportFraction: 0.7),
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Pallete.gradient2,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 1250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(galeries[index].profile),
                            fit: BoxFit.cover,
                          )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                galeries[index].name,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                galeries[index].position,
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        TabPageSelector(
          controller: TabController(
            length: galeries.length,
            initialIndex: currentIndex,
            vsync: this,
          ),
        )
      ],
    );
  }
}
