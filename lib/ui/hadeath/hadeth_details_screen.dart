import 'package:flutter/material.dart';
import 'package:islami_hamo/ui/hadeath/hadeath_content.dart';

import '../soura_detailes/verse_content.dart';

class HadehtDetailsScreen extends StatelessWidget {
  static const String routeName = "hadethdedails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/backgroundemage.png',
        ),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                child: args.content.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemBuilder: (buildContext, index) {
                          return VerseContent(args.content);
                        },
                        itemCount: args.content.length,
                        separatorBuilder: (buildContext, index) {
                          return Container(
                            color: Theme.of(context).primaryColor,
                            height: 2,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 64),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
