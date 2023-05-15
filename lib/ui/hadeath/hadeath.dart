import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_hamo/ui/hadeath/hadeath_content.dart';
import 'package:islami_hamo/ui/hadeath/hadeth_title.dart';

class HadeathTab extends StatefulWidget {
  @override
  State<HadeathTab> createState() => _HadeathTabState();
}

class _HadeathTabState extends State<HadeathTab> {
  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) readHadeth();
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: const Image(
                image: AssetImage('assets/images/hadeth_header_logo.png'))),
        Container(
          width: double.infinity,
          height: 3,
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.only(bottom: 4),
        ),
        const Text(
          "hadeth",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Container(
          width: double.infinity,
          height: 3,
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.only(bottom: 4),
        ),
        Expanded(
            flex: 3,
            child: Container(
                child: allHadeth.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemBuilder: (buildContext, index) {
                          return HadethTitle(allHadeth[index]);
                        },
                        itemCount: allHadeth.length,
                        separatorBuilder: (buildContext, index) {
                          return Container(
                            width: double.infinity,
                            height: 2,
                            color: Theme.of(context).primaryColor,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                          );
                        },
                      )))
      ],
    );
  }

  readHadeth() async {
    List<Hadeth> hadethList = [];
    String hadeth = await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> splittedContant = hadeth.split('#');
    for (int i = 0; i < splittedContant.length; i++) {
      String singleHadethContent = splittedContant[i];
      List<String> lines = singleHadethContent.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      String hadethContent = lines.join("\n");
      Hadeth hadeth = Hadeth(title, hadethContent);
      hadethList.add(hadeth);
    }
    allHadeth = hadethList;
    setState(() {});
  }
}
