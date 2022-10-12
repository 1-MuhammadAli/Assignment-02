import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  //final String time;
  const NewsCardWidget({
    Key? key,
    required this.name,required this.description,
    required this.image,//required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.black
      ),
      child: Stack(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 260.0,top: 15),
          //   child: Text(time,
          //     style: GoogleFonts.openSans(
          //         fontSize: 12,
          //         fontWeight: FontWeight.w400,
          //         color: Colors.cyan
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,top: 15),
            child:  Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all( Radius.circular(20.0)),
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text(name,style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: SizedBox(
                    width: 272,
                    child: Text(description,
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}