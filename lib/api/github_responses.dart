import 'package:github_repository_explorer/api/github_models.dart';

enum SearchRepositoryStatusCode { ok, notModified, validationFailed, unavailable }

Map<SearchRepositoryStatusCode, int> searchRepositoryStatusPairs = {
  SearchRepositoryStatusCode.ok: 200,
  SearchRepositoryStatusCode.notModified: 304,
  SearchRepositoryStatusCode.validationFailed: 422,
  SearchRepositoryStatusCode.unavailable: 503,
};

typedef SearchRepositoryResponse = ({
  SearchRepositoryStatusCode statusCode,
  List<RepositoryModel> repositories,
});
