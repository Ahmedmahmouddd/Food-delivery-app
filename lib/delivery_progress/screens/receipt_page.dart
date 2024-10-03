import 'package:flutter/material.dart';
import 'package:food_delivery_app/delivery_progress/components/my_receipt.dart';
import 'package:food_delivery_app/home/screens/home_page.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.arrow_back_ios_rounded, color: Theme.of(context).colorScheme.inversePrimary)),
        backgroundColor: Colors.transparent,
        title: Text('Delivery in progress..',
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
      body: ListView(
        children: [MyReceipt()],
      ),
    );
  }
}

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person, color: Theme.of(context).colorScheme.inversePrimary)),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John doe",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Driver", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.textsms_rounded, color: Theme.of(context).colorScheme.inversePrimary)),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.call, color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}
