// Code here based on tutorial at https://daily-dev-tips.com/posts/build-a-todo-list-app-with-flutter/

// importing material dart package, which gives us access to additional widgets and properties
import 'package:flutter/material.dart';

// creating the class that defines out Todo element, containing the name of the item and whether or not it has been checked off
class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  // The checked state is not final since we will modify it later on
  bool checked;
}

// creating the class that is a single represntation of each todo item on the list, needs to be a separate widget
class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  // passing in a todo and a change handler to it
  final Todo todo;
  final onTodoChanged;

  // boolean to evaluate if checked or not, if so then the style options below are selected
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    // text styles defined here, with lineThrough being what is shown when clicked
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  // Widget to actually display something
  @override
  Widget build(BuildContext context) {
    return ListTile( 
      // tap to invoke the onTodoChanged function
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      // Title with style defined above
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}

// calling the _TodoListState to evaluate what needs to be rendered
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}

// Defining the _TodoListState here which contains the widget template and other functions
class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  // Defining the list of todo items here
  final List<Todo> _todos = <Todo>[];

  // Widget template is as follows
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar will hold the title of the section
      appBar: new AppBar(
        title: new Text('Todo list'),
      ),
      // Body will be a ListView with todos as children
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        // Mapping each todo in the state and returning a TodoItem for each element
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
          );
        }).toList(),
      ),
      // FAB that will invoke the _displayDialog pop up box when pressed
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  // function for checking todo items
  void _handleTodoChange(Todo todo) {
    // when invoked, simply swith the boolean to swap between the checked and unchecked states
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  // the actual function to add the todo item to the list
  void _addTodoItem(String name) {
    // invokes a state change
    setState(() {
      // adding our todo to the list of todos
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  // Future in this case is the text string that the user will type in the future, 
  // which will be available after the user clicks add and types something
  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          // TextField here that uses the controller we define as variable
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          // Action here is the button that is pressed that will add the to do item
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                // invoking _addTodoItem here to pass the textfields text in properly
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}


// StatelessWidget is the skeleton around the actual list
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we use the material app here to get the styling settings
    return new MaterialApp(
      title: 'Todo list',
      // TodoList function is defined above
      home: new TodoList(),
    );
 }
}

// Main function to return an instance of the TodoApp, which we built above
void main() => runApp(new TodoApp());
