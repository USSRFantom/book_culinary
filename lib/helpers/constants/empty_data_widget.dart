import 'package:flutter/material.dart';

/// Виджет - Здесь пока пусто
class EmptyDataWidget extends StatelessWidget {
  final String text;
  final String description;

  const EmptyDataWidget({
    Key? key,
    required this.text,
    this.description = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          elevation: 0,
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 24 / 16,
            color: Colors.black,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
