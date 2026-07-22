import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Text('FavoritePage')],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Icon(Icons.search, size: 100),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.green),
              child: const Icon(Icons.favorite_border, size: 100),
            ),
          ),
        ],
      ),
    ),
  );
}
