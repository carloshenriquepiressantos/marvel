import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../_exports.dart';
import '_exports.dart';
import 'components/card_marvel_hero.dart';

class HomeMarvelPage extends GetView<MarvelController> {
  const HomeMarvelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: const BottomAppBar(color: Colors.red),
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Center(
                child: Text(
              'Home Marvel Heros Page',
              style: TextStyle(color: Colors.white),
            ))),
        body: ListView.builder(
          itemCount: controller.heros.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => CardMarvelHero(
              name: controller.heros[index].name,
              image: controller.heros[index].image),
        ),
      ),
    );
  }
}
