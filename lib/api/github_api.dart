import 'dart:async';

import 'package:github_repository_explorer/api/api_utils.dart' as api_utils;
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/api/github_responses.dart' as github_responses;
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.github.com/';
const searchRepositoryUrl = '${baseUrl}search/repositories';

Future<github_responses.SearchRepositoryResponse> searchRepositories(String query) async {
  final response = await http.get(Uri.parse('$searchRepositoryUrl?q=$query'));
  final statusCode = api_utils.enumFromInt(
    response.statusCode,
    github_responses.searchRepositoryStatusPairs,
  );
  final List<RepositoryModel> repositories;
  if (statusCode == github_responses.SearchRepositoryStatusCode.ok) {
    repositories = repositoriesFromJson(response.body);
  } else {
    repositories = <RepositoryModel>[];
  }
  return (statusCode: statusCode, repositories: repositories);
}
