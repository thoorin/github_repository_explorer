import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_api.dart' as github_api;
import 'package:github_repository_explorer/api/github_models.dart';
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
                  for (final repo in repositories)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.black12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      repo.primaryLanguage,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(Icons.star),
                                  Text(repo.starsCount.toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    repo.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'by ${repo.ownerName}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(repo.description, maxLines: 1),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
