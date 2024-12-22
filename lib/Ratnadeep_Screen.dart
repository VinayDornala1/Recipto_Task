import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipto_task/Ratnadeep/ratnadeep_bloc.dart';

class Ratnadeep_Screen extends StatefulWidget {
  const Ratnadeep_Screen({super.key});

  @override
  State<Ratnadeep_Screen> createState() => _Ratnadeep_ScreenState();
}

class _Ratnadeep_ScreenState extends State<Ratnadeep_Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isAtTop = true;

  List<Map<String, String>> ratnadeepList = [
    {
      "type": "Claim",
      "images": "assets/images/Rectangle 9.png",
      "claim": "assets/images/Frame 2127 (1).png",
      "Apply": "Claim",
      "color1": "0xffEBFAFF",
      "color2": "0xffB8E5FF"
    },
    {
      "type": "Claim",
      "images": "assets/images/Gift box - Purple 2.png",
      "claim": "assets/images/Frame 2127.png",
      "Apply": "Get for ₹450",
      "color1": "0xffF8EFFC",
      "color2": "0xffEAD3F7"
    },
    {
      "type": "Claim",
      "images": "assets/images/Group 1619.png",
      "claim": "assets/images/Frame 1804.png",
      "Apply": "Applied",
      "color1": "0xffFEF9F0",
      "color2": "0xffFFF5E0"
    },
    {
      "type": "Claim",
      "images": "assets/images/Frame 2134.png",
      "claim": "assets/images/Frame 1804 (2).png",
      "Apply": "Applied",
      "color1": "0xffEBFAFF",
      "color2": "0xffB8E5FF"
    },
    {
      "type": "Coupon",
      "images": "assets/images/Product images.png",
      "claim": "assets/images/Frame 2127 (1).png",
      "Apply": "Claim",
      "rupees": "₹120",
      "rupees1": "₹145",
      "rupees2": "₹25 OFF",
      "coins": "110",
      "productName": "Drool Chicken & Egg Adult Dog Food"
    },
    {
      "type": "Coupon",
      "images": "assets/images/Product images (1).png",
      "claim": "assets/images/Frame 2127.png",
      "Apply": "Claim",
      "rupees": "₹60",
      "rupees1": "₹70",
      "rupees2": "₹70 OFF",
      "coins": "40",
      "productName": "ADIDOG Combo of 3 Squeaky Active Balls"
    },
    {
      "type": "Coupon",
      "images": "assets/images/Product images (2).png",
      "claim": "assets/images/Frame 1804.png",
      "Apply": "Claim",
      "rupees": "₹120",
      "rupees1": "₹145",
      "rupees2": "₹25 OFF",
      "coins": "150",
      "productName": "Pedigree Dry Dog Food for Puppy (pack of 2)"
    },
    {
      "type": "Coupon",
      "images": "assets/images/Product images (3).png",
      "claim": "assets/images/Frame 1804 (2).png",
      "Apply": "Claim",
      "rupees": "₹120",
      "rupees1": "₹145",
      "rupees2": "₹25 OFF",
      "coins": "280",
      "productName": "Farmina Vetlife Renal Dog Food 2kg"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<RatnadeepBloc, RatnadeepState>(
            builder: (context, state) {
              return Stack(
                children: [
                  /*Positioned.fill(child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:
                      bottomS
                    ),
                  ),),*/
                  NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        if (scrollNotification.metrics.pixels <= 0) {
                          setState(() {
                            _isAtTop = true;
                          });
                        } else {
                          setState(() {
                            _isAtTop = false;
                          });
                        }
                      }
                      return true;
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          if (_isAtTop) ...[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/arrow_back.png',
                                      height: 20),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset(
                                          'assets/images/Store Logo.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Ratnadeep Supermarket',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      'Poppins-SemiBold',
                                                  fontWeight: FontWeight.w600,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '3% cashback * ₹250 Welcome Bonus',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins-Regular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  TabBar(
                                    controller: _tabController,
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.grey,
                                    indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 4),
                                      insets: EdgeInsets.symmetric(
                                          horizontal:
                                              0.0), // Fixed width adjustment
                                    ),
                                    tabs: [
                                      Tab(
                                        child: Text(
                                          "Store Visit",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Regular',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff5764DA),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Online ",
                                              style: TextStyle(
                                                fontFamily: 'Poppins-Regular',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF8EFFC),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  "10% BACK",
                                                  style: TextStyle(
                                                    color: Color(0xffE40C81),
                                                    fontFamily:
                                                        'Poppins-Regular',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Divider for separation
                                ],
                              ),
                            ),
                          ] else ...[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/arrow_back.png',
                                        height: 20),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Magnolia Bakery',
                                      style: TextStyle(
                                          fontFamily: 'Poppins-SemiBold',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                          // TabBarView to display tab content
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                // First Tab Content
                                storeVisitTab(),
                                // Second Tab Content
                                OffersTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            listener: (context, state) {}),
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      // isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Proof of transaction',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff000000),
                  fontFamily: 'Poppins-Regular',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Scan Receipt/share payment screenshot to earn',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Share Payment image',
                        style: TextStyle(
                          color: Color(0xff5764DA),
                          fontSize: 14,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        'assets/images/long.png',
                        height: 20,
                      )
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xff5764DA), // Change background color
                  ),
                  child: Text(
                    'Scan Receipt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }

  Widget storeVisitTab() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: SingleChildScrollView(
          child: GridView.builder(
            padding: EdgeInsets.all(0),
            itemCount: ratnadeepList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 200,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final item = ratnadeepList[index];
              final imagePath = item["images"] ?? "";
              final claimPath = item["claim"] ?? "";

              return ratnadeepList[index]["type"] == "Claim"
                  ? GestureDetector(
                      onTap: () {
                        bottomSheet();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(int.parse(item["color1"]!)),
                                  Color(int.parse(item["color2"]!)),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10, bottom: 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  imagePath,
                                  height: 66,
                                ),
                                Image.asset(claimPath),
                                Spacer(),
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      (300 ~/ (2 * 10)).toInt(),
                                      (index) => SizedBox(
                                        height: 2,
                                        width: 8,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[350]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  height: 30,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .white, // Change background color
                                      ),
                                      child: Text(
                                        ratnadeepList[index]['Apply']!,
                                        style: TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontWeight: FontWeight.w600,
                                            color: ratnadeepList[index]
                                                        ['Apply'] ==
                                                    "Applied"
                                                ? Colors.grey
                                                : Color(0xff000000)),
                                      )),
                                )
                              ],
                            ),
                          )),
                    )
                  : GestureDetector(
                      onTap: () {
                        bottomSheet();
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.2))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  imagePath,
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ratnadeepList[index]['productName']!
                                      .toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Medium',
                                      fontSize: 11,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ratnadeepList[index]['rupees']!
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ratnadeepList[index]['rupees1']!
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          fontSize: 10,
                                          color: Color(0xff9E9E9E),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ratnadeepList[index]['rupees2']!
                                          .toString(),
                                      style: TextStyle(
                                          color: Color(0xffDA2667),
                                          fontFamily: 'Poppins-Regular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/coin.png',
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ratnadeepList[index]['coins']!,
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontFamily: 'Poppins-SemiBold',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      height: 26,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          // Your action here
                                        },
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  5.0), // Adjust horizontal padding

                                          side: BorderSide(
                                              color: Colors.grey, width: 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30), // Rounded corners
                                          ),
                                        ),
                                        child: Text(
                                          ratnadeepList[index]['Apply']!,
                                          style: TextStyle(
                                              color: Color(0xff5764DA),
                                              fontFamily: 'Poppins-SemiBold',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          )),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget OffersTab() {
    return Center(
      child: Text(
        'Content for Offers 10% BACK',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
