import 'package:flutter/material.dart';
class EcommerceDetail extends StatelessWidget {
  const EcommerceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff016140),
        // padding: EdgeInsets.only(top: 2,),
        child: GestureDetector(
          // onTap: () {
          //   bool status = false;
          //   int index = 0;
          //   for (int i = 0; i < cartList.length; i++) {
          //     if (cartList[i]['productName'] ==
          //         productDisplayList[0]['productName']) {
          //       index = i;
          //       status = true;
          //     }
          //   }
          //   if (status == true) {
          //     cartList.add(productDisplayList[0]);
          //     // cartList[index]['member']++;
          //   } else {
          //     cartList.add(productDisplayList[0]);
          //   }
          //   Navigator.pushNamed(context, '/cart');
          // },
          child: Container(
            height: h * 0.1,
            width: w * 0.86,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Text(
              'Add to cart',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          // productDisplayList[0]['productName'],
          '',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/favorite');
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              GestureDetector(
                // onDoubleTap: () {
                //   setState(() {
                //     bool likestatus = false;
                //     int index = 0;
                //     for (int i = 0; i < favoriteList.length; i++) {
                //       if (favoriteList[i]['productName'] ==
                //           favoriteList[0]['productName']) {
                //         index = i;
                //         likestatus = true;
                //       }
                //     }
                //     if (likestatus == true) {
                //       favoriteList.add(productDisplayList[0]);
                //       // cartList[index]['member']++;
                //     } else {
                //       favoriteList.add(productDisplayList[0]);
                //     }
                //     showLimitedTimeDialog(context);
                //   });
                //
                //   // return  Lottie.asset('assets/LottieLogo1.json'),
                //   // isHeartAnimating = true;
                //   // isLiked = true;
                //   // print('add to favorite');
                // },
                child: Stack(
                  children: [
                    Container(
                      height: h * 0.6,
                      width: w * 0.99 + 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("productDisplayList[0]['image']"),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.27,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: w * 0.035),
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.04,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/StarBucks_Logos/vegIcon.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.02),
                                  Text(
                                    // 'VEGETARIAN  ${productDisplayList[0]['celsius']}',
                                    '',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: w * 0.035),
                                  Text(
                                    // productDisplayList[0]['productName'],
                                    '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: w * 0.035),
                                  SizedBox(
                                    width: w * 0.86,
                                    child: Text(
                                      // productDisplayList[0]['description'],
                                      '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: w * 0.035),
                                  Text(
                                    // productDisplayList[0]['category'],
                                    '',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: h * 0.07,
                width: w * 1,
                decoration: BoxDecoration(
                    color: Color(0xff007549),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'CURRENT ITEM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          // productDisplayList[0]['productName'],
                          '',
                          style: TextStyle(
                              color: Colors.white,
                              // fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.white,
                          size: 19,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          // productDisplayList[0]['price'].toString(),
                          '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

