import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/view/detail_page/detail_page.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard(this.repository, this.onReturned, {super.key});

  final RepositoryModel repository;
  final VoidCallback onReturned;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: GestureDetector(
      onTap: () async {
        await Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (context) => DetailPage(repository: repository)));
        onReturned();
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      repository.primaryLanguage,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const Icon(Icons.star),
                  Text(repository.starsCount.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repository.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('by ${repository.ownerName}', style: const TextStyle(fontSize: 18)),
                  Text(repository.description, maxLines: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
