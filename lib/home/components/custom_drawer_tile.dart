import 'package:flutter/material.dart';

class CustomDrawerTile extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData icon;
  const CustomDrawerTile({super.key, required this.title, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.inversePrimary),
        title: Text(title,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }
}
