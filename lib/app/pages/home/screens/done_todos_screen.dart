import 'package:flutter/material.dart';

class DoneTodosScreen extends StatelessWidget {
  const DoneTodosScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Done todos')
      )
    );
  }
}