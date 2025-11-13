import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String name;          
  final IconData iconType;    
  final Color color;          

  const HobbyCard({
    super.key,
    required this.name,
    required this.iconType,
    this.color = Colors.blue, // default value 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: Icon(
              iconType,
              color: Colors.white,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // main UI
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Hobbies"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HobbyCard(
                name: "Travelling",
                iconType: Icons.travel_explore,
                color: Colors.deepPurpleAccent,
              ),
              HobbyCard(
                name: "Reading",
                iconType: Icons.menu_book,
                color: Colors.grey,
              ),
              HobbyCard(
                name: "Singing",
                iconType: Icons.mic,
                // color is optional, can use default blue
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
