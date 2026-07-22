import 'package:flutter/material.dart';
import 'package:github_repository_explorer/pages/favorite_page/favorite_page.dart';

Future<void> favoritesNavigationButtonTapped(BuildContext context) async {
  await Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute<void>(builder: (context) => const FavoritePage()));
}
