import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_api.dart' as github_api;
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/pages/components/repository_card.dart';
import 'package:github_repository_explorer/pages/favorite_page/favorite_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RepositoryModel> repositories = [];
  getRepos(String value) async {
    final result = await github_api.searchRepositories(value);
    print(result);
    setState(() {
      repositories = result.repositories;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: <Widget>[
                  SearchBar(onSubmitted: getRepos),
                  for (final repo in repositories) RepositoryCard(repo, () {}),
                ],
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
