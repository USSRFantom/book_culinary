import 'package:culinary_book/domain/models/recipe_model.dart';
import 'package:culinary_book/helpers/constants/constant_colors.dart';
import 'package:culinary_book/view/section/home_screen/widgets/cardRecipe.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RecipeModel> listModelRecipe = [];

  @override
  void initState() {
    listModelRecipe = [
      RecipeModel(
          img: 'assets/svg/img1.png',
          title: 'Лосось в соусе терияки',
          time: 45),
      RecipeModel(
          img: 'assets/svg/img2.png',
          title: 'Поке боул с сыром тофу',
          time: 30),
      RecipeModel(
          img: 'assets/svg/img3.png',
          title: 'Стейк из говядины по грущзински с сыром и чесноком',
          time: 75),
      RecipeModel(
          img: 'assets/svg/img4.png',
          title: 'Тосты с голубикой и бананом',
          time: 45),
      RecipeModel(
          img: 'assets/svg/img5.png',
          title: 'Паста с морепродуктами',
          time: 25),
      RecipeModel(
          img: 'assets/svg/img6.png',
          title: 'Пицца Маргарита домашняя',
          time: 25),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 45),
        child: SingleChildScrollView(
          child: Column(
            children: _listWidgetRecipe(listModelRecipe),
          ),
        ),
      ),
    );
  }

  List<Widget> _listWidgetRecipe(List<RecipeModel> listRecipeModel) {
    List<Widget> result = [];
    for (var element in listRecipeModel) {
      result.add(
        Column(
          children: [
            CardRecipe(
              img: element.img,
              title: element.title,
              time: element.time,
            ),
            const SizedBox(height: 24)
          ],
        ),
      );
    }
    return result;
  }
}
