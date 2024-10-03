import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_gate/login_or_register.dart';
import 'package:food_delivery_app/home/components/custom_drawer_tile.dart';
import 'package:food_delivery_app/settings/screens/setting_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            // Logo
            Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Icon(Icons.lock_open_outlined,
                    size: 100, color: Theme.of(context).colorScheme.inversePrimary)),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Divider(color: Theme.of(context).colorScheme.secondary),
            ),

            // Drawer Tiles
            CustomDrawerTile(
                icon: Icons.home,
                title: "H O M E",
                onTap: () {
                  Navigator.pop(context);
                }),
            CustomDrawerTile(
                icon: Icons.settings,
                title: "S E T T I N G S",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
                }),
            const Spacer(),
            CustomDrawerTile(
                icon: Icons.logout_outlined,
                title: "L O G O U T",
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const LoginOrRegister()), (route) => false);
                }),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}
