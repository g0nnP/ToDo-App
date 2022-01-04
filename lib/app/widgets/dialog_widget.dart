import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';
import '../pages/home/bloc/todos/todos_bloc.dart';

class AddTodoDialog extends StatelessWidget {
  AddTodoDialog({ Key? key }) : super(key: key);

  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodosBloc>();
    if(Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text('Add To Do'),
        content: Column(
          children: [
            CupertinoTextField(
              controller: _titleCtrl,
              placeholder: 'Title',
              onChanged: (text) => text = _titleCtrl.text,
            ),
            const SizedBox(height: 8,),
            CupertinoTextField(
              controller: _descCtrl,
              placeholder: 'Description',
              onChanged: (text) => text = _descCtrl.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  child: const Text('Save'),
                  onPressed: (){
                    final todo = TodoModel(
                      _titleCtrl.text,
                      _descCtrl.text,
                      false
                    );
                    bloc.add(AddTodoEvent(todo));
                    Navigator.pop(context);
                  }
                ),
                CupertinoButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context)
                )
              ]
            )
          ],
        ),
      );
    } else {
      return AlertDialog(
        title: const Text('Add To Do'),
        content: SizedBox(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Title'
                ),
                controller: _titleCtrl,
                onChanged: (text) => text = _titleCtrl.text,
              ),
              const SizedBox(height: 8,),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Description'
                ),
                controller: _descCtrl,
                onChanged: (text) => text = _descCtrl.text,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    child: const Text('Save'),
                    onPressed: () {
                      final todo = TodoModel(
                        _titleCtrl.text,
                        _descCtrl.text,
                        false
                      );
                      bloc.add(AddTodoEvent(todo));
                      Navigator.pop(context);
                    },
                  ),
                  MaterialButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}