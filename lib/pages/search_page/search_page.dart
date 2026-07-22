import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_api.dart' as github_api;
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/pages/components/navigation_row.dart';
import 'package:github_repository_explorer/pages/components/repository_card.dart';
import 'package:github_repository_explorer/pages/search_page/search_page_controller.dart'
    as controller;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RepositoryModel> repositories = [];
  Future<void> searchRepositories(String value) async {
    final result = await github_api.searchRepositories(value);
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
                  SearchBar(onSubmitted: searchRepositories),
                  for (final repository in repositories) RepositoryCard(repository, () {}),
                ],
              ),
            ),
          ),
          const NavigationRow(onFavoritesTapped: controller.favoritesNavigationButtonTapped),
        ],
      ),
    ),
  );
}
