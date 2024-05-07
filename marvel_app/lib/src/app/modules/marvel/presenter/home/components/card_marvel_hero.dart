// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardMarvelHero extends StatelessWidget {
  const CardMarvelHero({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        ListTile(
          title: Center(child: Text(name)),
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: Image.network(image),
        ),
      ]),
    );
  }
}
