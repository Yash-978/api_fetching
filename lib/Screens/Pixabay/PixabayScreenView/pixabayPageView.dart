import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PixabayModel/pixabayModel.dart';
import '../PixabayProvider/pixabayProvider.dart';

TextEditingController txtSearch = TextEditingController();

class PixabayPageView extends StatelessWidget {
  const PixabayPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    PixabayProvider pixabayProviderFalse = Provider.of(context, listen: false);
    PixabayProvider pixabayProviderTrue = Provider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  pixabayProviderFalse.searchImage(value);
                },
                controller: txtSearch,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Search Images'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  pixabayProviderFalse.searchImage(txtSearch.text);
                },
                icon: Icon(Icons.search)),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<PixabayProvider>(context, listen: false)
            .fromMap(pixabayProviderTrue.search),
        builder: (context, snapshot) {
          
          if (snapshot.hasData) {
            PixabayModel? viewHome = snapshot.data;
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: viewHome!.hits.length,
              itemBuilder: (context, index) {
                Container(
                  height: 0.4,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image:
                        NetworkImage("${viewHome.hits[index].largeImageURL}"),
                  )),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
