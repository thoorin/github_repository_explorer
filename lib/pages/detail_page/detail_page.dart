import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/pages/detail_page/detail_page_controller.dart'
    as controller;

class DetailPage extends StatefulWidget {
  const DetailPage({required this.repository, super.key});

  final RepositoryModel repository;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
      child: const Icon(Icons.favorite_border),
      onPressed: () {
        controller.favoritesButtonTapped(widget.repository);
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
