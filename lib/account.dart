import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelance2/API/BaseUrl.dart';
import 'package:freelance2/Offers/Offer.dart';
import 'package:freelance2/selling.dart';
import 'API/API.dart';
import 'API/GloabalVariable.dart';
import 'Addtochart.dart';
import 'PopularProduct.dart';
import 'constant.dart';
import 'lists.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/Page1.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 100,
                                width: 100,
                                child: Image.asset('assets/page2.png'),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: MediaQuery.of(context).size.height / 23,
                                width: MediaQuery.of(context).size.width / 3.6,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                    child: Text(
                                      'Follow',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                          fontSize: 12),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(top:7.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 5.3,
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Savannah Nguyen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: 2,),),
                                 SizedBox(height: 75,),
                                  Container(
                                    height: 23,
                                    width: 10,
                                    child: RatingBar.builder(
                                      initialRating: 3.5,
                                      minRating: 1,
                                      direction: Axis.vertical,
                                      allowHalfRating: true,
                                      itemCount: 4,
                                      itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(

                                    children: [
                                      Column(
                                        children: [
                                          Text('5'),
                                          Text('Sales',style: LiteText,),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          Text('324'),
                                          Text('Follow',style: LiteText,),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          Text('17'),
                                          Text('Following',style: LiteText),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),


                      Container(
                        child: Divider(
                          color: Color(0xffF4F4F4),
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height*2,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text('SELLING',style: Textprimary ,),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(userproduct.length.toString(),style: LiteText,),
                                    ],
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: ()
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => selling()),
                                      );
                                    },
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text('View All  -->',style: TextStyle(fontSize: 13,color: Colors.blue,letterSpacing: 2,),),
                                      )),
                                ],
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 3.5,
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.black,
                                child: GridView.builder(

                                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: userproduct.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.4,
                                                    decoration: BoxDecoration(
                                                      color: Greycolor,
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                    ),
                                                    child: Image.network(BaseUrl+
                                                        userproduct[index].image),
                                                  ),
                                                ],
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(
                                              //       left: 120.0, top: 77),
                                              //   // child: Container(
                                              //   //   height: 30,
                                              //   //   width: 30,
                                              //   //   decoration: BoxDecoration(
                                              //   //     color: Colors.white,
                                              //   //     borderRadius:
                                              //   //         BorderRadius.circular(20),
                                              //   //   ),
                                              //   //   child: Image.asset(
                                              //   //       'assets/fire.png'),
                                              //   // ),
                                              // ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(top:123.0),
                                              //   child: Column(
                                              //     mainAxisAlignment: MainAxisAlignment.start,
                                              //     crossAxisAlignment: CrossAxisAlignment.start,
                                              //     children: [
                                              //       Text('Air Jordan 1 Dior',style: TextStyle(fontSize: 10),),
                                              //       Text('425 AED',style: TextStyle(fontSize: 10)),
                                              //       Text('Used',style: TextStyle(fontSize: 10)),
                                              //
                                              //     ],
                                              //   ),
                                              // )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  userproduct[index].name,
                                                  style: ListName1,
                                                ),
                                                Text(userproduct[index].prices,
                                                    style: ListName2),
                                                Text(userproduct[index].type==0?"Used":"New",
                                                    style: ListName3),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Divider(
                                color: Color(0xffF4F4F4),
                                height: 5,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text('OFFERS',style: Textprimary ,),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(recivedorder.length.toString(),style: LiteText,),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => offer()),
                                          );
                                        },
                                        child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text('View All  -->',style: TextStyle(fontSize: 13,color: Colors.blue,letterSpacing: 2,),),
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: 170,
                                decoration: BoxDecoration(
                                    color: Color(0xffF4F4F4),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    // recivedorder.length!=null?Row(
                                    //   children: [
                                    //     Container(
                                    //         width: 120,
                                    //         child: Image.network(BaseUrl+recivedorder[recivedorder.length].image, fit: BoxFit.fill,)
                                    //     ),
                                    //      Padding(
                                    //       padding: const EdgeInsets.only(left:18.0),
                                    //       child: Column(
                                    //         mainAxisAlignment: MainAxisAlignment.start,
                                    //         crossAxisAlignment: CrossAxisAlignment.start,
                                    //         children: [
                                    //           SizedBox(height: 10,),
                                    //           Text(recivedorder[recivedorder.length].name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                    //           SizedBox(height: 8,),
                                    //           Text(recivedorder[recivedorder.length].type==0?"Used |":"New |" +
                                    //               recivedorder[recivedorder.length].size, style: TextStyle(color: Colors.grey),),
                                    //           SizedBox(height: 8,),
                                    //           Text("AED "+recivedorder[recivedorder.length].prices, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                                    //
                                    //         ],
                                    //       ),
                                    //     )
                                    //
                                    //   ],
                                    // ):Container(),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.green),
                                              borderRadius: BorderRadius.circular(3)
                                          ),
                                          child:  Center(child: Text("Accept", style: TextStyle(color: Colors.green , fontSize: 10,letterSpacing: 2,),)),
                                        ),
                                       Spacer(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text('FAVOURITE',style: Textprimary ,),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(wishlistshow.length.toString(),style: LiteText,),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PopularProduct()),
                                        );
                                      },
                                        child: Text('View All  -->',style: TextStyle(fontSize: 13,color: Colors.blue,letterSpacing: 2,),)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                height: MediaQuery.of(context).size.height / 2.0,
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.black,
                                child: GridView.builder(

                                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                                  // physics:
                                  // NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: wishlistshow.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap:(){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => addtrochart(favourite: wishlistshow[index].isFavourite,
                                                          product: wishlistshow[index],)),
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 100,
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                          2.4,
                                                      decoration: BoxDecoration(
                                                        color: Greycolor,
                                                        borderRadius:
                                                        BorderRadius.circular(10),
                                                      ),
                                                      child: Image.network(
                                                          BaseUrl + wishlistshow[index].image),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 120.0, top: 77),
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(20),
                                                  ),
                                                  child: Image.asset(
                                                      'assets/fire.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(top: 1.0),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  wishlistshow[index].name,
                                                  style: ListName1,
                                                ),
                                                Text(wishlistshow[index].prices+' AED',
                                                    style: ListName2),
                                                Text(wishlistshow[index].type==0?"Used":"New",
                                                    style: ListName3),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),

                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
        // floatingActionButton: Container(
        //
        //   height: 65.0,
        //   width: 65.0,
        //   child: FittedBox(
        //     child: FloatingActionButton(
        //       onPressed: () {},
        //       child: Icon(
        //         Icons.add,
        //         color: Colors.white,
        //       ),
        //       // elevation: 5.0,
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation:
        // FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: Container(
        //
        //   decoration: BoxDecoration(
        //     color: Colors.black,
        //     borderRadius: BorderRadius.only(
        //
        //         topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        //     boxShadow: [
        //       BoxShadow(
        //           color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        //     ],
        //   ),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(30.0),
        //       topRight: Radius.circular(30.0),
        //     ),
        //     child: BottomAppBar(
        //       // elevation: 20.0,
        //
        //       // shape: CircularNotchedRectangle(),
        //         child: Container(
        //           height: 60,
        //           child: Row(
        //             // mainAxisSize: MainAxisSize.max,
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //
        //             children: <Widget>[
        //               IconButton(
        //                 iconSize: 30.0,
        //                 padding: EdgeInsets.only(left: 28.0),
        //                 icon: Icon(Icons.home),
        //                 onPressed: () {
        //                   setState(() {});
        //                 },
        //               ),
        //
        //               IconButton(
        //                 iconSize: 30.0,
        //                 padding: EdgeInsets.only(right: 28.0),
        //                 icon: Icon(Icons.local_fire_department),
        //                 onPressed: () {
        //                   setState(() {});
        //                 },
        //               ),
        //               IconButton(
        //                 iconSize: 30.0,
        //                 padding: EdgeInsets.only(left: 28.0),
        //                 icon: Icon(Icons.auto_fix_off),
        //                 onPressed: () {
        //                   setState(() {});
        //                 },
        //               ),
        //               IconButton(
        //                 iconSize: 30.0,
        //                 padding: EdgeInsets.only(right: 28.0),
        //                 icon: Icon(Icons.person_rounded),
        //                 onPressed: () {
        //                   setState(() {});
        //                 },
        //               )
        //             ],
        //           ),
        //         )),
        //   ),
        // )
    );
  }
}
