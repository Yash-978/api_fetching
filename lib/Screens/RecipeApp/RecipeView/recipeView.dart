import 'package:api_fetching/Screens/RecipeApp/RecipeProvider/recipeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
int selectedIndex=0;
class RecipePageView extends StatelessWidget {
  const RecipePageView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    RecipeProvider recipeProviderTrue =
        Provider.of<RecipeProvider>(context, listen: true);
    RecipeProvider recipeProviderFalse =
        Provider.of<RecipeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe'),
      ),
      body: FutureBuilder(
        future: recipeProviderFalse.fromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: recipeProviderTrue.recipeModel!.recipes.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  selectedIndex=index;
                  Navigator.of(context).pushNamed('/recipeDetail');
                },
                child: SizedBox(
                  width: w * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: h * 0.25,
                        width: w * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(recipeProviderTrue
                                .recipeModel!.recipes[index].image),
                          ),
                        ),
                      ),
                      Text(
                        recipeProviderTrue.recipeModel!.recipes[index].name +
                            '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            recipeProviderTrue
                                    .recipeModel!.recipes[index].cuisine +
                                '   ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            recipeProviderTrue
                                    .recipeModel!.recipes[index].reviewCount
                                    .toString() +
                                '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
