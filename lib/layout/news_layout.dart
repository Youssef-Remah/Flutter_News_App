import 'package:flutter/material.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions:
        [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
