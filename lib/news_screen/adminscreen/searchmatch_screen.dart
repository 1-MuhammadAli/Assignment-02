import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'components/searchmatchcard_widget.dart';

class SearchMatchScreen extends StatefulWidget {
  SearchMatchScreen({Key? key}) : super(key: key);

  @override
  State<SearchMatchScreen> createState() => _SearchMatchScreenState();
}

int? selectIndex;
MatchModel? matchModel;

class _SearchMatchScreenState extends State<SearchMatchScreen> {
  List<MatchModel> matchesList = [
    MatchModel(
        id: 1,
        image:
            'https://free-dxf.com/storage/resized/public/designs/pictures/GVGtp-800x800/5923.jpg',
        league: 'FIFA Matches',
        match: 'ENG - GR'),
    MatchModel(
        id: 2,
        image:
            'https://free-dxf.com/storage/resized/public/designs/pictures/GVGtp-800x800/5923.jpg',
        league: 'Premier League',
        match: 'CHL - ARS'),
    MatchModel(
        id: 3,
        image:
            'https://free-dxf.com/storage/resized/public/designs/pictures/GVGtp-800x800/5923.jpg',
        league: 'UEFA Champion League',
        match: 'UFC - ARS'),
    MatchModel(
        id: 4,
        image:
            'https://free-dxf.com/storage/resized/public/designs/pictures/GVGtp-800x800/5923.jpg',
        league: 'Premier League',
        match: 'ENG - GR'),
    MatchModel(
        id: 5,
        image:
            'https://free-dxf.com/storage/resized/public/designs/pictures/GVGtp-800x800/5923.jpg',
        league: 'FIFA Matches',
        match: 'CHL - ARS'),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Container(
      height: screenSize.height*0.75,
      //height: 750,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff1E232F),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            width: 39,
            color: Colors.grey,
          ),
          SizedBox(
            height: 63,
          ),
          Container(
            height: screenSize.height*0.63,
            //height: 616,
            color: Color(0xff1E232F),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: matchesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, left: 16, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xff232835),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      title: TextWidget(
                        text: matchesList[index].league,
                        fontWeight: FontWeight.w400,
                        textSize: 16,
                        color: Color(0xffFFFFFF),
                      ),
                      subtitle: TextWidget(
                          text: matchesList[index].match,
                          fontWeight: FontWeight.w400,
                          textSize: 12,
                          color: Colors.grey),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(matchesList[index].image),
                      ),
                      trailing: selectIndex == index
                          ? const Icon(
                              Icons.check_circle_outline,
                              color: Colors.cyan,
                            )
                          : const Icon(Icons.circle_outlined,
                              color: Colors.cyan),
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                          matchid = matchesList[index].id;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MatchModel {
  final int id;
  final String image;
  final String league;
  final String match;
  MatchModel(
      {required this.id,
      required this.image,
      required this.league,
      required this.match});
}
