import 'package:flutter/material.dart';

const selectedColor = Color.fromRGBO(140, 140, 140, 255);
const unselectedColor = Color.fromRGBO(200, 200, 200, 255);

class NavigationRow extends StatelessWidget {
  const NavigationRow({
    required this.isSearchSelected,
    super.key,
    this.onFavoritesTapped,
    this.onSearchTapped,
  });

  final bool isSearchSelected;
  final Function(BuildContext)? onSearchTapped;
  final Function(BuildContext)? onFavoritesTapped;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Container(height: 50, decoration: const BoxDecoration(color: unselectedColor)),
      Positioned(
        bottom: 0,
        child: Container(
          height: 50,
          width: 1000,
          decoration: const BoxDecoration(color: selectedColor),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await onSearchTapped?.call(context);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isSearchSelected ? selectedColor : unselectedColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: const Icon(Icons.search, size: 100),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await onFavoritesTapped?.call(context);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isSearchSelected ? unselectedColor : selectedColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: const Icon(Icons.favorite_border, size: 100),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
