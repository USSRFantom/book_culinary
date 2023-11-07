import 'package:book_culinary/helpers/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class DetailedRecipeScreen extends StatefulWidget {
  static const String route = '/detail';

  const DetailedRecipeScreen({Key? key}) : super(key: key);

  @override
  State<DetailedRecipeScreen> createState() => _DetailedRecipeScreenState();
}

class _DetailedRecipeScreenState extends State<DetailedRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Рецепт',
            style: TextStyle(color: greenColor2, fontSize: 20),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Image(
              image: AssetImage(
                'assets/svg/megafon.png',
              ),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Image(
            image: AssetImage(
              'assets/svg/back.png',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
