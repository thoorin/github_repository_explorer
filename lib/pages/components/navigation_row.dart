import 'package:flutter/material.dart';

class NavigationRow extends StatelessWidget {
  const NavigationRow({super.key, this.onFavoritesTapped, this.onSearchTapped});

  final Function(BuildContext)? onSearchTapped;
  final Function(BuildContext)? onFavoritesTapped;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () async {
            await onSearchTapped?.call(context);
          },
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: Icon(Icons.search, size: 100),
          ),
        ),
      ),
      const Expanded(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
          child: Icon(Icons.favorite_border, size: 100),
        ),
      ),
    ],
  );
}
