import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      return CupertinoAlertDialog(
        title: const Text('Add To Do'),
        content: Column(
          children: [
            CupertinoTextField(
              placeholder: 'Title',
            ),
            CupertinoTextField(
              placeholder: 'Description',
            )
          ],
        ),
      );
    } else {
      return AlertDialog(
        title: const Text('Add To Do'),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(),
            ),
            TextField(
              decoration: InputDecoration(),
            )
          ],
        ),
      );
    }
  }
}