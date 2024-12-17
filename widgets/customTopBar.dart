import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSortByName;
  final VoidCallback onSortBySubjectsLength;

  const CustomTopBar({
    super.key,
    required this.onSortByName,
    required this.onSortBySubjectsLength,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 156, 206, 43),
      title: Row(
        children: [
          Image.asset(
            'assets/icon/contacticon_small.png',
            height: 40,
          ),
          const SizedBox(width: 10),
          const Text(
            'Contacts',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.sort_by_alpha),
          onPressed: onSortByName,
        ),
        IconButton(
          icon: const Icon(Icons.sort),
          onPressed: onSortBySubjectsLength,
        ),
      ],
    );
  }
}