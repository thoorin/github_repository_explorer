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

Map<String, dynamic> repositoryToMap(RepositoryModel repository) => {
  'name': repository.name,
  'ownerName': repository.ownerName,
  'forksCount': repository.forksCount,
  'openIssuesCount': repository.openIssuesCount,
  'starsCount': repository.starsCount,
  'description': repository.description,
  'primaryLanguage': repository.primaryLanguage,
  'url': repository.url,
};

RepositoryModel repositoryFromMap(Map<String, dynamic> map) => (
  name: map['name'] as String,
  ownerName: map['ownerName'] as String,
  forksCount: map['forksCount'] as int,
  openIssuesCount: map['openIssuesCount'] as int,
  starsCount: map['starsCount'] as int,
  description: map['description'] as String,
  primaryLanguage: map['primaryLanguage'] as String,
  url: map['url'] as String,
);
