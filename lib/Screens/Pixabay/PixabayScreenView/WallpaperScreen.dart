import 'package:api_fetching/Screens/Pixabay/PixabayModel/pixabayModel.dart';
import 'package:api_fetching/Screens/Pixabay/PixabayProvider/pixabayProvider.dart';
import 'package:api_fetching/Screens/Pixabay/PixabayScreenView/pixabayPageView.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WallpaperPage extends StatelessWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var pixabayProviderFalse =
        Provider.of<PixabayProvider>(context, listen: false);
    var pixabayProviderTrue =
        Provider.of<PixabayProvider>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            String result;
            try {
              result = await AsyncWallpaper.setWallpaper(
                url: pixabayProviderTrue
                    .pixabayModel!.hits[selectWallpaperPage].largeImageURL,
                wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                goToHome: false,
                toastDetails: ToastDetails.success(),
                errorToastDetails: ToastDetails.error(),
              )
                  ? 'Wallpaper set'
                  : 'Failed to get wallpaper.';
            } on PlatformException {
              result = 'Failed to get wallpaper.';
            }
          },
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.black)),
            child: const Center(
                child: Text(
              'Set Wallpaper',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<PixabayProvider>(context, listen: false)
            .fromApi(pixabayProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PixabayModel? viewWallpaper = snapshot.data;
            return Flexible(
                child: Container(
              height: h * 1,
              width: w * 1,
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: FadeInImage(
                fit: BoxFit.cover,
                // placeholderFit: BoxFit.fitHeight,
                placeholder:
                    AssetImage('assets/images/CPI-pixabay-unscreen.gif'),
                image: NetworkImage(
                    viewWallpaper!.hits[selectWallpaperPage].largeImageURL),
              ),
            )
                // Container(
                //   height: h*1,
                //   width: w*1,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     image: DecorationImage(
                //       fit: BoxFit.fill,
                //       image: NetworkImage(viewWallpaper!
                //           .hits[selectWallpaperPage].largeImageURL),
                //     ),
                //   ),
                // ),
                );
          } else {
            return Center(
              child: FadeInImage(
                  placeholder:
                      AssetImage('assets/images/CPI-pixabay-unscreen.gif'),
                  image: AssetImage('assets/images/CPI_pixabay.gif')),
            );
          }
        },
      ),
    );
  }
}
