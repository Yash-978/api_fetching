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
    var pixabayProviderFalse =
        Provider.of<PixabayProvider>(context, listen: false);
    var pixabayProviderTrue =
        Provider.of<PixabayProvider>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 620,
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  FutureBuilder(
                    future: Provider.of<PixabayProvider>(context, listen: false)
                        .fromApi(pixabayProviderTrue.search),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        PixabayModel? viewWallpaper = snapshot.data;
                        return Flexible(
                          child: Center(
                            child: Container(
                              height: 615,
                              width: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(viewWallpaper!
                                      .hits[selectWallpaperPage].largeImageURL),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: FadeInImage(
                              placeholder:
                                  AssetImage('assets/images/CPI_pixabay.gif'),
                              image:
                                  AssetImage('assets/images/CPI_pixabay.gif')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
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
            )
          ],
        ),
      ),
    );
  }
}
