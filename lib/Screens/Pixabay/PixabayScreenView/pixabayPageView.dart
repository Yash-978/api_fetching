import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PixabayModel/pixabayModel.dart';
import '../PixabayProvider/pixabayProvider.dart';

TextEditingController txtSearch = TextEditingController();

class PixabayPageView extends StatelessWidget {
  const PixabayPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var pixabayProviderFalse =
        Provider.of<PixabayProvider>(context, listen: false);
    var pixabayProviderTrue =
        Provider.of<PixabayProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.account_circle_outlined,
          size: 30,
        ),
        scrolledUnderElevation: 0.1,
        title: TextFormField(
          onFieldSubmitted: (value) {
            pixabayProviderFalse.searchImage(value);
          },
          controller: txtSearch,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              // onTap: () {
              //   pixabayProviderFalse.searchImage(pixabayProviderFalse.search);
              // },
              child: const Icon(Icons.close),
            ),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search Images',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<PixabayProvider>(context, listen: false)
            .fromApi(pixabayProviderTrue.search),
        builder: (context, snapshot) {
          PixabayModel? viewImage = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: viewImage!.hits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => Container(
                  height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(viewImage!.hits[index].largeImageURL),
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.hasError.toString()),
                Text(snapshot.error.toString()),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

//
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     PixabayProvider pixabayProviderFalse = Provider.of<PixabayProvider>(context, listen: false);
//     PixabayProvider pixabayProviderTrue = Provider.of<PixabayProvider>(context, listen: true);
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 onChanged: (value) {
//                   pixabayProviderFalse.searchImage(value);
//                 },
//                 controller: txtSearch,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search),
//                   label: Text('Search Images'),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             IconButton(
//                 onPressed: () {
//                   pixabayProviderFalse.searchImage(pixabayProviderFalse.search);
//                 },
//                 icon: Icon(Icons.search)),
//           ],
//         ),
//       ),
//       body: FutureBuilder(
//         future: Provider.of<PixabayProvider>(context, listen: false)
//             .fromApi(pixabayProviderFalse.search),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             PixabayModel? viewHome = snapshot.data;
//             return GridView.builder(
//               gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               itemCount: viewHome!.hits.length,
//               itemBuilder: (context, index) {
//                 Container(
//                   height: 0.4,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                     image:
//                         NetworkImage("${viewHome.hits[index].largeImageURL}"),
//                   )),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text(
//               snapshot.error.toString(),
//               style: TextStyle(color: Colors.black, fontSize: 25),
//             ));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
