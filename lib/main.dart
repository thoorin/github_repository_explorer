import 'package:flutter/material.dart';
import 'package:github_repository_explorer/view/search_page/search_page.dart';
import 'package:github_repository_explorer/storage.dart' as storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await storage.loadFavorites();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(theme: ThemeData(), home: const SearchPage());
}
