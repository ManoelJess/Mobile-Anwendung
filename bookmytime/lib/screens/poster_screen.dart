import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class PosterScreen extends StatefulWidget {
  const PosterScreen({ Key? key }) : super(key: key);

  @override
  _PosterScreenState createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      color: themeProvider.currentTheme.primaryColor,
    );
  }
}