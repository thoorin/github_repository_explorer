import 'package:flutter/material.dart';
import 'package:github_repository_explorer/view/favorite_page/favorites_page.dart';

Future<void> favoritesNavigationButtonTapped(BuildContext context) async {
  await Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute<void>(builder: (context) => const FavoritesPage()));
}
