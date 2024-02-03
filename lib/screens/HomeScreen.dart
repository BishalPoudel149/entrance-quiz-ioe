import 'package:flutter/material.dart';
import 'package:ientrance/repository/authentication_repository/authentication_repository.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({super.key, required this.title});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logOut();
              },
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Welcome message
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Play quiz with friends button
          ElevatedButton(
            onPressed: () {
              // Add code here to start the quiz
            },
            child: Text('Play quiz together with your friends now!'),
          ),
          // Top collections section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Top collections',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // List of top collections
          Expanded(
            child: ListView(
              children: [
                // Replace these with actual collection data
                CollectionItem(title: 'Teachers'),
                CollectionItem(title: 'Top authors'),
                CollectionItem(title: 'Find friends'),
              ],
            ),
          ),
          // Home collection section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Home Collection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // List of home collection items
          Expanded(
            child: ListView(
              children: [
                // Replace these with actual collection data
                CollectionItem(title: 'Education'),
                CollectionItem(title: 'Play'),
                CollectionItem(title: 'Q Q'),
                CollectionItem(title: '+'),
                CollectionItem(title: 'Create'),
                CollectionItem(title: 'Show all'),
                CollectionItem(title: 'Games'),
                CollectionItem(title: 'Show all'),
                CollectionItem(title: 'Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionItem extends StatelessWidget {
  final String title;

  CollectionItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(Icons.library_books),
    );
  }
}
