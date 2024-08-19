import 'package:api_fetching/Screens/RecipeApp/RecipeView/recipeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../RecipeProvider/RecipeDetailProvider.dart';
import '../RecipeProvider/recipeProvider.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     RecipeProvider recipeProviderTrue =
//         Provider.of<RecipeProvider>(context, listen: true);
//     RecipeProvider recipeProviderFalse =
//         Provider.of<RecipeProvider>(context, listen: false);
//     // RecipeDetailPage recipeDetailPageTrue =
//     //     Provider.of<RecipeDetailPage>(context, listen: true);
//     // RecipeDetailPage recipeDetailPageFalse =
//     //     Provider.of<RecipeDetailPage>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       bottomNavigationBar: BottomAppBar(
//         color: Color(0xff016140),
//         // padding: EdgeInsets.only(top: 2,),
//         child: Container(
//           height: h * 0.1,
//           width: w * 0.86,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30), color: Colors.white),
//           child: Text(
//             'Add to cart',
//             style: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           // productDisplayList[0]['productName'],
//           '',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/favorite');
//               },
//               icon: Icon(
//                 Icons.favorite_border,
//                 color: Colors.white,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: FutureBuilder(
//         future: recipeProviderFalse.fromApi(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Stack(
//               children: [
//                 ListView(
//                   children: [
//                     GestureDetector(
//                       // onDoubleTap: () {
//                       //   setState(() {
//                       //     bool likestatus = false;
//                       //     int index = 0;
//                       //     for (int i = 0; i < favoriteList.length; i++) {
//                       //       if (favoriteList[i]['productName'] ==
//                       //           favoriteList[0]['productName']) {
//                       //         index = i;
//                       //         likestatus = true;
//                       //       }
//                       //     }
//                       //     if (likestatus == true) {
//                       //       favoriteList.add(productDisplayList[0]);
//                       //       // cartList[index]['member']++;
//                       //     } else {
//                       //       favoriteList.add(productDisplayList[0]);
//                       //     }
//                       //     showLimitedTimeDialog(context);
//                       //   });
//                       //
//                       //   // return  Lottie.asset('assets/LottieLogo1.json'),
//                       //   // isHeartAnimating = true;
//                       //   // isLiked = true;
//                       //   // print('add to favorite');
//                       // },
//                       child: Stack(
//                         children: [
//                           Container(
//                             height: h * 0.6,
//                             width: w * 0.99 + 10,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(recipeProviderTrue
//                                     .recipeModel!.recipes[selectedIndex].image),
//                               ),
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(25),
//                                 topRight: Radius.circular(25),
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.fullscreen,
//                                       color: Colors.white,
//                                       size: 40,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: h * 0.27,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         SizedBox(width: w * 0.035),
//                                         Container(
//                                           height: h * 0.04,
//                                           width: w * 0.04,
//                                         ),
//                                         SizedBox(width: w * 0.02),
//                                         Text(
//                                           // 'VEGETARIAN  ${productDisplayList[0]['celsius']}',
//                                           '',
//                                           textAlign: TextAlign.start,
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         SizedBox(width: w * 0.035),
//                                         Text(
//                                           // productDisplayList[0]['productName'],
//                                           '',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         SizedBox(width: w * 0.035),
//                                         SizedBox(
//                                           width: w * 0.86,
//                                           child: Text(
//                                             // productDisplayList[0]['description'],
//                                             '',
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         SizedBox(width: w * 0.035),
//                                         Text(
//                                           // productDisplayList[0]['category'],
//                                           '',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: h * 0.07,
//                       width: w * 1,
//                       decoration: BoxDecoration(
//                           color: Color(0xff007549),
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               topRight: Radius.circular(20))),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Column(
//                             children: [
//                               SizedBox(
//                                 height: h * 0.01,
//                               ),
//                               Text(
//                                 textAlign: TextAlign.center,
//                                 'CURRENT ITEM',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 textAlign: TextAlign.center,
//                                 // productDisplayList[0]['productName'],
//                                 '',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     // fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.currency_rupee,
//                                 color: Colors.white,
//                                 size: 19,
//                               ),
//                               Text(
//                                 textAlign: TextAlign.center,
//                                 // productDisplayList[0]['price'].toString(),
//                                 '',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var recipeProviderFalse =
        Provider.of<RecipeProvider>(context, listen: false);
    var recipeProviderTrue = Provider.of<RecipeProvider>(context, listen: true);
    var detailRecipeProviderFalse =
        Provider.of<RecipeDetailProvider>(context, listen: false);
    var detailRecipeProviderTrue =
        Provider.of<RecipeDetailProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.account_circle_outlined),
        title: const Text('Recipe Details'),
      ),
      body: FutureBuilder(
        future: recipeProviderFalse.fromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: height * 0.35,
                  width: width,
                  child: Image.network(
                    recipeProviderTrue
                        .recipeModel!.recipes[selectedIndex].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          recipeProviderTrue
                              .recipeModel!.recipes[selectedIndex].name,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    (detailRecipeProviderTrue.selectedPage == 0)
                                        ? const Border(
                                            bottom: BorderSide(
                                              width: 3,
                                              color: Colors.amber,
                                            ),
                                          )
                                        : null,
                              ),
                              child: const Text(
                                'Ingredients',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    (detailRecipeProviderTrue.selectedPage == 1)
                                        ? const Border(
                                            bottom: BorderSide(
                                              width: 3,
                                              color: Colors.amber,
                                            ),
                                          )
                                        : null,
                              ),
                              child: const Text(
                                'Instructions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                          flex: 2,
                          child: PageView(
                            onPageChanged: (value) {
                              detailRecipeProviderFalse.changePage(value);
                            },
                            children: [
                              Text(
                                recipeProviderTrue.recipeModel!
                                    .recipes[selectedIndex].ingredients
                                    .join(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                recipeProviderTrue.recipeModel!
                                    .recipes[selectedIndex].instructions
                                    .join(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: height * 0.11,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text(
                                          '${recipeProviderTrue.recipeModel!.recipes[selectedIndex].cookTimeMinutes} Mins',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text(
                                      'Cooking Time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: height * 0.11,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text(
                                          '${recipeProviderTrue.recipeModel!.recipes[selectedIndex].prepTimeMinutes} Mins',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text(
                                      'Prepare Time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
