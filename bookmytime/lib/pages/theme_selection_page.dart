import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class ThemeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Theme'),
        backgroundColor: themeProvider.currentTheme.primaryColor,
      ),
      body: ListView.builder(
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final currentTheme = AppTheme.values[index];
          return ListTile(
            title: Text('Theme ${index + 1}'),
            tileColor: themeProvider.currentTheme.primaryColor,
            onTap: () {
              themeProvider.setTheme(currentTheme);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
