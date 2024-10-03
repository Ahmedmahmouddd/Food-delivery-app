import 'package:flutter/material.dart';
import 'package:food_delivery_app/settings/components/darkmode_toggle_component.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded, color: Theme.of(context).colorScheme.inversePrimary)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: true,
        title: Text("Settings", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
      ),
      body: const Column(
        children: [
          DarkModeSettingsToggleComponent(),
        ],
      ),
    );
  }
}
