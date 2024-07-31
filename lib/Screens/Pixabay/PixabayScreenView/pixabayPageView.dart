import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        centerTitle: true,

        scrolledUnderElevation: 0.1,
        title: TextFormField(
          onFieldSubmitted: (value) {
            pixabayProviderFalse.searchImage(value);
          },
          controller: txtSearch,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                pixabayProviderFalse.clearField();
              },
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
            return GridView.builder(
              itemCount: viewImage!.hits.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 9 / 16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  selectWallpaperPage = index;
                  Navigator.of(context).pushNamed('/wallpaper');
                },
                child: Container(
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
            return Center(
              child: CircularProgressIndicator(),
            );

            // Center(
            //   child: FadeInImage(placeholder: AssetImage('assets/images/CPI_pixabay.gif'), image: AssetImage('assets/images/CPI_pixabay.gif')),
            // );
          }
        },
      ),
    );
  }
}
