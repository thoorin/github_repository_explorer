import 'package:flutter/material.dart';
import 'package:github_repository_explorer/pages/favorite_page/favorite_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                children: <Widget>[SearchBar()],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: const Icon(Icons.search, size: 100),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(builder: (context) => const FavoritePage()),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.green),
                    child: const Icon(Icons.favorite_border, size: 100),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
