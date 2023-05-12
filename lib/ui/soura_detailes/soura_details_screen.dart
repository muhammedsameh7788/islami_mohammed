import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_hamo/ui/soura_detailes/verse_content.dart';

class SouraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sora detailes screen';

  @override
  State<SouraDetailsScreen> createState() => _SouraDetailsScreenState();
}

class _SouraDetailsScreenState extends State<SouraDetailsScreen> {
  List<String> souraContent = [];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as SouraDetailsScreenArgs;
    if (souraContent.isEmpty) readFile(args.index);
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
                  child: souraContent.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemBuilder: (buildContext, index) {
                            return VerseContent(souraContent[index]);
                          },
                          itemCount: souraContent.length,
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
        ));
  }

  void readFile(int souraIndex) async {
    String text =
        await rootBundle.loadString('assets/files/${souraIndex + 1}.txt');

    souraContent = text.split('/n');
    setState(() {});
  }
}

class SouraDetailsScreenArgs {
  String title;

  int index;

  SouraDetailsScreenArgs(this.title, this.index);
}
