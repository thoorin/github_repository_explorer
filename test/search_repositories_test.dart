import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/api/github_api.dart' as github_api;
import 'package:github_repository_explorer/api/github_responses.dart';

void main() {
  test('Invalid', () async {
    final response = await github_api.searchRepositories('');
    expect(response.statusCode, SearchRepositoryStatusCode.validationFailed);
    expect(response.repositories, equals([]));
  });

  test('Valid but without result', () async {
    final response = await github_api.searchRepositories(
      '3241768914379681348769123786912347689148794168179462',
    );
    expect(response.statusCode, SearchRepositoryStatusCode.ok);
    expect(response.repositories, equals([]));
  });

  test('Valid', () async {
    final response = await github_api.searchRepositories('github');
    expect(response.statusCode, SearchRepositoryStatusCode.ok);
  });
}
