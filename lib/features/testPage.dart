import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Text(
          'Hello User, you are logged in!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
