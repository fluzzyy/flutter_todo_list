import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';


typedef ToggleTodoCallBack = void Function(Todo,bool);

class TodoList extends StatelessWidget{

  TodoList({@required this.todos,this.onTodoToggle});

  final List<Todo>todos;
  final ToggleTodoCallBack onTodoToggle;

  
    Widget _buildItem(BuildContext context, int index){
      final todo = todos[index];

        return CheckboxListTile(
              value: todo.isDone,
              title: Text(todo.title),
              onChanged: (bool isChecked){
                onTodoToggle(todo, isChecked);
              },
        );
    }
           
@override
    Widget build(BuildContext context) {
      
        return ListView.builder(
          itemBuilder: _buildItem,
          itemCount: todos.length,
        );
}
}