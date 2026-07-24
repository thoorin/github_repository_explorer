import 'dart:convert';

import 'package:github_repository_explorer/api/github_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<RepositoryModel> favorites = [];

const _favoritesKey = 'favorites_list';

Future<void> loadFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  final favoritesJson = prefs.getString(_favoritesKey);
  if (favoritesJson != null) {
    final List<dynamic> decoded = jsonDecode(favoritesJson);
    favorites = decoded.map((item) => repositoryFromMap(Map<String, dynamic>.from(item))).toList();
  }
}

Future<void> saveFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  final toSave = favorites.map(repositoryToMap).toList();
  await prefs.setString(_favoritesKey, jsonEncode(toSave));
}
