class Poster{
  final String posterMessage;
  final List<String> posterImages;

  Poster({required this.posterMessage, required this.posterImages});
}

List<String> plantImages = ['assets/images/plant_care1.jpg','assets/images/plant_care2.jpg','assets/images/plant_care3.jpg','assets/images/plant_care4.jpg'];

List<String> doctorGrup = ['assets/images/call_doct1.jpg','assets/images/call_doct2.jpg','assets/images/call_doct3.jpg','assets/images/call_doct4.jpg'];

List<String> people = ['assets/images/talk_people.jpg'];


List<Poster> allPoster =[
  Poster(posterMessage: 'You can help others care for their plants', posterImages: plantImages),
  Poster(posterMessage: 'For health questions, you can book appointments directly with doctors and have them consult you.', posterImages: doctorGrup),
  Poster(posterMessage: 'With the chat option, you can chat with other people', posterImages: people)
];