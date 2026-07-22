import 'dart:convert';

typedef RepositoryModel = ({
  String name,
  String ownerName,
  int forksCount,
  int openIssuesCount,
  int starsCount,
  String description,
  String primaryLanguage,
  String url,
});

List<RepositoryModel> repositoriesFromJson(String jsonString) {
  final dto = jsonDecode(jsonString) as Map;
  final items = dto['items'] as List;
  final repositories = <RepositoryModel>[];
  for (final Map item in items) {
    final String name = item['name'];
    final owner = item['owner'] as Map;
    final String ownerName = owner['login'];
    final int forksCount = item['forks_count'];
    final int openIssuesCount = item['open_issues_count'];
    final int starsCount = item['stargazers_count'];
    final String description = item['description'] ?? '';
    final String primaryLanguage = item['language'] ?? '';
    final String url = item['url'];
    repositories.add((
      name: name,
      ownerName: ownerName,
      forksCount: forksCount,
      openIssuesCount: openIssuesCount,
      starsCount: starsCount,
      description: description,
      primaryLanguage: primaryLanguage,
      url: url,
    ));
  }

  return repositories;
}
