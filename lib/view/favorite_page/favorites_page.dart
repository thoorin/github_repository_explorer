import 'package:flutter/material.dart';
import 'package:github_repository_explorer/storage.dart' as storage;
import 'package:github_repository_explorer/view/components/navigation_row.dart';
import 'package:github_repository_explorer/view/components/repository_card.dart';
import 'package:github_repository_explorer/view/favorite_page/favorites_page_controller.dart'
    as controller;

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
                  const Text(
                    'Favorite Repositories',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  if (storage.favorites.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        'You have not favorited any repositories yet.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  else
                    for (final repo in storage.favorites)
                      RepositoryCard(repo, () {
                        setState(() {});
                      }),
                ],
              ),
            ),
          ),
          const NavigationRow(
            isSearchSelected: false,
            onSearchTapped: controller.searchNavigationButtonTapped,
          ),
        ],
      ),
    ),
  );
}
