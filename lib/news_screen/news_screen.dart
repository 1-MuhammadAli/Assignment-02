
import 'package:flutter/material.dart';

import 'adminscreen/admin_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _selectedIndex = 0;
  final _pageOptions = [
   AdminScreen(),
   AdminScreen(),
   AdminScreen(),
   AdminScreen(),
   AdminScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Fixture',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leader',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            label: 'News',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}












// import 'package:assignment_no_2/feed_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// int selectedPage=0;
// class NewsScreen extends StatefulWidget {
//   const NewsScreen({super.key});
//
//   @override
//   State<NewsScreen> createState() => _NewsScreenState();
// }
//
// class _NewsScreenState extends State<NewsScreen> {
//
//   final _pageOptions = [
//    FeedScreen(),
//    FeedScreen(),
//    FeedScreen(),
//    FeedScreen(),
//    FeedScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         extendBody: true,
//         body: _pageOptions[selectedPage],
//         bottomNavigationBar: BottomAppBar(
//             child: Container(
//               width: double.infinity,
//               height: 65,
//               color: Colors.transparent,
//               child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BottomBarBtnWidget(title: 'Home', icon: Icons.home,pageNumber: 0,onPressed: () {
//                           setState(() {
//                             selectedPage=0;
//                           });
//                         },),
//                         BottomBarBtnWidget(title: 'Fixture', icon: Icons.list,pageNumber: 1,onPressed: () {
//                           setState(() {
//                             selectedPage=1;
//                           });
//                         },),
//                         BottomBarBtnWidget(title: 'Leader', icon: Icons.leaderboard,pageNumber: 2,onPressed: () {
//                           setState(() {
//                             selectedPage=2;
//                           });
//                         },),
//                         BottomBarBtnWidget(title: 'News', icon: Icons.wifi,pageNumber: 3,onPressed: () {
//                           setState(() {
//                             selectedPage=3;
//                           });
//                         },),
//                         BottomBarBtnWidget(title: 'Setting', icon: Icons.settings,pageNumber: 4,onPressed: () {
//                           setState(() {
//                             selectedPage=4;
//                           });
//                         },),
//                       ],
//                     ),
//             ),
//           ),
//       ),
//     );
//   }
// }
//
// class BottomBarBtnWidget extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final int pageNumber;
//   final VoidCallback onPressed;
//   BottomBarBtnWidget({required this.title,required this.icon,required this.pageNumber,required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialButton(
//       onPressed: onPressed,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:  [
//           selectedPage==pageNumber? Icon(icon,color: Color(0xff07AD5A),): Icon(icon,color: Colors.grey,),
//           selectedPage == pageNumber? Text(title,style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             color: Color(0xff07AD5A),
//           ),): Text(title,style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//           ),),
//         ],
//       ),
//     );
//   }
// }
