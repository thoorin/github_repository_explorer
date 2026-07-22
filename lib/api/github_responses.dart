import 'package:github_repository_explorer/api/github_models.dart';

enum SearchRepositoryStatusCode { ok, notModified, validationFailed, unavailable }

Map<SearchRepositoryStatusCode, int> searchRepositoryStatusPairs = {
  SearchRepositoryStatusCode.ok: 200,
  SearchRepositoryStatusCode.notModified: 304,
  SearchRepositoryStatusCode.validationFailed: 422,
  SearchRepositoryStatusCode.unavailable: 503,
};

T enumFromInt<T>(int statusCode, Map<T, int> statusPairs) =>
    statusPairs.entries.firstWhere((entry) => entry.value == statusCode).key;

int? enumToInt<T>(T enumStatusCode, Map<T, int> statusPairs) => statusPairs[enumStatusCode];

typedef SearchRepositoryResponse = ({
  SearchRepositoryStatusCode statusCode,
  List<RepositoryModel> repositories,
});
