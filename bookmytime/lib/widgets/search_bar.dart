import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizeSearchBar extends StatefulWidget {
  final double height;
  const CustomizeSearchBar({Key? key, this.height = 18}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<CustomizeSearchBar> {

  onSearch(String valueToSearch){
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: TextField(
        onChanged: (value) =>onSearch(value) ,
        decoration: InputDecoration(
            filled: true,
            fillColor: Pallete.kWhiteColor,
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Pallete.kGreyColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            hintStyle: TextStyle(fontSize: 12, color: Pallete.kGreyColor),
            hintText: 'Search hier'),
      ),
    );
  }
}
