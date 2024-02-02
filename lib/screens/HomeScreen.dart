import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Row(
          children: [
            // Logo and Title on the left
            Image.asset(
              'assets/images/logo.png', // Replace with your logo image asset path
              width: 40,
              height: 40,
              // Add any additional styling or constraints as needed
            ),
            SizedBox(width: 8),
            Text(
              'IO_ Tops',
              style: GoogleFonts.singleDay(
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        actions: [
          // Search Icon
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          // Notification Icon
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add your notification functionality here
            },
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          //top bar with logo and search func.

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