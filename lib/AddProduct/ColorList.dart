import 'package:flutter/material.dart';


class ColorList {
  var dest;




  ColorList({
    @required this.dest,
  });
}

List<ColorList> colorList = [
  ColorList(

    dest: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: CircleAvatar(
        backgroundColor: Color(0xff000000) ,radius: 20,),
    ),


  ),
  ColorList(

    dest: Container(

      child: CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xffD5D5D5),
          foregroundColor: Colors.black,
          child: CircleAvatar (backgroundColor: Color(0xffFFFFFF) ,
            radius: 20,)
      ),
    ),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xffFF6565) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xffE3F575) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xff62C46C) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xff62C46C) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xff62C46C) ,radius: 20,),

  ),
];