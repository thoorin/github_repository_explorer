import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/storage.dart' as storage;

void favoritesButtonTapped(RepositoryModel repository) {
  if (storage.favorites.contains(repository)) {
    storage.favorites.remove(repository);
  } else {
    storage.favorites.add(repository);
  }
}
