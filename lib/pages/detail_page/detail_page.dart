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
      onPressed: () {
        if (alreadyInFavorites) {
          storage.favorites.remove(widget.repository);
        } else {
          storage.favorites.add(widget.repository);
        }
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.repository.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('by ${widget.repository.ownerName}', style: const TextStyle(fontSize: 16)),
                  Text(
                    widget.repository.primaryLanguage,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.repository.starsCount.toString()),
                      Text(widget.repository.forksCount.toString()),
                      Text(widget.repository.openIssuesCount.toString()),
                    ],
                  ),
                  Text(widget.repository.url),
                  Text(widget.repository.description),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
