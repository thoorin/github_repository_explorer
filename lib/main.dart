import 'package:flutter/material.dart';
import 'package:github_repository_explorer/pages/search_page/search_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(theme: ThemeData(), home: const SearchPage());
}
