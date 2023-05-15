import 'package:flutter/material.dart';
import 'package:islami_hamo/ui/hadeath/hadeath_content.dart';

import 'hadeth_details_screen.dart';

class HadethTitle extends StatelessWidget {
  Hadeth hadeth;

  HadethTitle(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadehtDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Center(
        child: Container(
          child: Text(
            hadeth.title,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
