import 'package:flutter/material.dart';
import 'package:islami_hamo/ui/soura_detailes/soura_details_screen.dart';

class SouraNameWidget extends StatelessWidget {
  String title;
  int index;

  SouraNameWidget(this.title, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SouraDetailsScreen.routeName,
            arguments: SouraDetailsScreenArgs(title, index));
      },
      child: Center(
        child: Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
