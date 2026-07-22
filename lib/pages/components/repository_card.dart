import 'package:flutter/material.dart';
import 'package:github_repository_explorer/api/github_models.dart';
import 'package:github_repository_explorer/pages/detail_page/detail_page.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard(this.repo, this.onReturned);
  final RepositoryModel repo;
  final Function onReturned;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: GestureDetector(
      onTap: () async {
        await Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (context) => DetailPage(repository: repo)));
        onReturned();
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      repo.primaryLanguage,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(Icons.star),
                  Text(repo.starsCount.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repo.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('by ${repo.ownerName}', style: const TextStyle(fontSize: 16)),
                  Text(repo.description, maxLines: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
