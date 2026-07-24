import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_api.dart' as github_api;
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/api/github_responses.dart';
import 'package:github_repository_explorer/view/components/navigation_row.dart';
import 'package:github_repository_explorer/view/components/repository_card.dart';
import 'package:github_repository_explorer/view/search_page/search_page_controller.dart'
    as controller;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

enum _State { initial, loading, loaded, noResult, error }

class _SearchPageState extends State<SearchPage> {
  _State state = _State.initial;
  List<RepositoryModel> repositories = [];
  String lastQuery = '';

  Future<void> searchRepositories(String value) async {
    lastQuery = value;
    setState(() {
      state = _State.loading;
    });
    final result = await github_api.searchRepositories(value);
    setState(() {
      repositories = result.repositories;
      if (result.statusCode != SearchRepositoryStatusCode.ok) {
        state = _State.error;
      } else if (repositories.isEmpty) {
        state = _State.noResult;
      } else {
        state = _State.loaded;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      child: Column(
        children: [
          const Text(
            'Search Repositories',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SearchBar(onSubmitted: searchRepositories),
                  ),
                  if (state == _State.error)
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            'Something went wrong',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await searchRepositories(lastQuery);
                          },
                          child: const Text('Try again'),
                        ),
                      ],
                    )
                  else if (state == _State.noResult)
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        'No repositories found for given query.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  else if (state == _State.loading)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else
                    for (final repository in repositories) RepositoryCard(repository, () {}),
                ],
              ),
            ),
          ),
          const NavigationRow(
            isSearchSelected: true,
            onFavoritesTapped: controller.favoritesNavigationButtonTapped,
          ),
        ],
      ),
    ),
  );
}
