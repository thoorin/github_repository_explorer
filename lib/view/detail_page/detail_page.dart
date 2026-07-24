import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/storage.dart' as storage;

class DetailPage extends StatefulWidget {
  const DetailPage({required this.repository, super.key});

  final RepositoryModel repository;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool alreadyInFavorites;

  @override
  void initState() {
    alreadyInFavorites = storage.favorites.contains(widget.repository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: alreadyInFavorites ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
      onPressed: () async {
        if (alreadyInFavorites) {
          storage.favorites.remove(widget.repository);
        } else {
          storage.favorites.add(widget.repository);
        }
        await storage.saveFavorites();
        setState(() {
          alreadyInFavorites = !alreadyInFavorites;
        });
      },
    ),
    body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.repository.name,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text('by ${widget.repository.ownerName}', style: const TextStyle(fontSize: 20)),
                  Text(
                    widget.repository.primaryLanguage,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        const Icon(Icons.star_border),
                        Expanded(child: Text(widget.repository.starsCount.toString())),
                        const Icon(Icons.call_split),
                        Expanded(child: Text(widget.repository.forksCount.toString())),
                        const Icon(Icons.circle_outlined),
                        Text(widget.repository.openIssuesCount.toString()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.repository.url,
                    style: const TextStyle(decoration: TextDecoration.underline, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(widget.repository.description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
