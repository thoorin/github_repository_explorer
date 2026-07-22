import 'package:flutter/material.dart';
import 'package:github_repository_explorer/pages/components/navigation_row.dart';
import 'package:github_repository_explorer/pages/components/repository_card.dart';
import 'package:github_repository_explorer/pages/favorite_page/favorite_page_controller.dart'
    as controller;
import 'package:github_repository_explorer/storage.dart' as storage;

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const Text('FavoritePage'),
                  for (final repo in storage.favorites)
                    RepositoryCard(repo, () {
                      setState(() {});
                    }),
                ],
              ),
            ),
          ),
          const NavigationRow(onSearchTapped: controller.searchNavigationButtonTapped),
        ],
      ),
    ),
  );
}
