class GalerieModell {
  final String name;
  final String position;
  final String profile;

  GalerieModell(
      {required this.name, required this.position, required this.profile});
}

List<GalerieModell> galeries = [
  GalerieModell(
      name: "Take Care of plants from 20€/h",
      position: "I need person, who can lawn care and maintenance the complete institution in Mannheim",
      profile: "assets/images/plant_care3.jpg"),
  GalerieModell(
      name: "Talk with people, that you want",
      position:
          "You can talk with every registered person in the app and this free of charge",
      profile: "assets/images/talk_people.jpg"),
  GalerieModell(
      name: "Take care of plants from 14€/h",
      position: "You need some people, who can take care of my flours for 4 weeks.",
      profile: "assets/images/plant_care4.jpg"),
  GalerieModell(
      name: "Search an doctor for my Dog",
      position: "I don't know what my dog have",
      profile: "assets/images/call_doct1.jpg"),
];
