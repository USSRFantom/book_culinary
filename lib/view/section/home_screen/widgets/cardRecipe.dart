import 'package:culinary_book/helpers/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class CardRecipe extends StatelessWidget {
  final String img;
  final String title;
  final int time;

  const CardRecipe(
      {Key? key, required this.img, required this.title, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 136,
      child: Row(
        children: [
          SizedBox(
            width: 149,
            height: 136,
            child: Image(
              image: AssetImage(
                img,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 30, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: Image(
                            image: AssetImage(
                              'assets/svg/clock.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '$time мин',
                          style: TextStyle(fontSize: 16, color: colorGreen),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
