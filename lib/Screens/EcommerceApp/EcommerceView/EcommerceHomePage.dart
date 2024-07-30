import 'package:api_fetching/Screens/EcommerceApp/EcommerceModel/ecommerceModel.dart';
import 'package:api_fetching/Screens/EcommerceApp/EcommerceProvider/ecommerceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EcommerceHomePage extends StatelessWidget {
  const EcommerceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    EcommerceProvider ecommerceProviderTrue =
        Provider.of<EcommerceProvider>(context, listen: true);
    EcommerceProvider ecommerceProviderFalse =
        Provider.of<EcommerceProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: FutureBuilder(
        future: ecommerceProviderFalse.fromEcommerceApi(),
        builder: (context, snapshot) {
          EcommerceModel? ecommerceHomePage = snapshot.data;

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: ecommerceProviderTrue.ecommerceModel!.products.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: h * 0.4,
                      width: w * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            ecommerceProviderTrue
                                .ecommerceModel!.products[index].images[0],
                          ),
                        ),
                      ),
                    ),
                    Text(ecommerceProviderTrue
                        .ecommerceModel!.products[index].title)
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
