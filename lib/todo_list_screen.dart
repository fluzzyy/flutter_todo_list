import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

import 'package:todo_list/new_todo_dialog.dart';
import 'package:todo_list/todo_list.dart';


class TodoListScreen extends StatefulWidget{
  @override
  _TodoListScreenState createState() => _TodoListScreenState(); 
  
}
class _TodoListScreenState extends State<TodoListScreen>{

  List<Todo> todos = [];
         _toggleTodo(Todo todo,bool isChecked){
      setState(() {
       todo.isDone = isChecked; 
      });
    }
   
                _addTodo() async{
                  final todo = await showDialog<Todo>(
                context: context,
                builder: (BuildContext context){
                  return newTodoDialog();
                   
                },
              );
              if(todo != null){
                setState(() {
                 todos.add(todo); 
                });
              }
         
      }

@override
    Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: TodoList(
        todos: todos,
        onTodoToggle: _toggleTodo,
      ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: _addTodo,
      ),
      );
    }
  
}