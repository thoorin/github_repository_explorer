import 'package:flutter/material.dart';
import 'package:github_repository_explorer/view/search_page/search_page.dart';

Future<void> searchNavigationButtonTapped(BuildContext context) async {
  await Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute<void>(builder: (context) => const SearchPage()));
}
