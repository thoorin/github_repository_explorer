import 'package:flutter/material.dart';
import 'package:github_repository_explorer/pages/components/repository_card.dart';
import 'package:github_repository_explorer/pages/search_page/search_page.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(builder: (context) => const SearchPage()),
                    );
                  },
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Icon(Icons.search, size: 100),
                  ),
                ),
              ),
              const Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Icon(Icons.favorite_border, size: 100),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
