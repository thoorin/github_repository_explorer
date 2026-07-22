import 'package:flutter/material.dart';
import 'package:github_repository_explorer/pages/search_page/search_page.dart';

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
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Text('FavoritePage')],
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
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: const Icon(Icons.search, size: 100),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.green),
                  child: const Icon(Icons.favorite_border, size: 100),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
