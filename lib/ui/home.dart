import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/models/todo_model.dart';
import 'package:firebase_todo/ui/create_new_todo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    listenData();
  }

  void addToFirestore(TodoModel todo) async {
    FirebaseFirestore.instance
        .collection("todos")
        .doc(todo.id)
        .set(todo.toMap());
  }

  void updateToFirestore(TodoModel todo) async {
    FirebaseFirestore.instance
        .collection("todos")
        .doc(todo.id)
        .update(todo.toMap());
  }

  void deleteFromFirestore(TodoModel todo) async {
    FirebaseFirestore.instance.collection("todos").doc(todo.id).delete();
  }

  final todosRef = FirebaseFirestore.instance
      .collection("todos")
      .limit(30)
      .withConverter<TodoModel>(
    fromFirestore: (data, snap) {
      return TodoModel.fromMap(data.data()!);
    },
    toFirestore: (data, snap) {
      return data.toMap();
    },
  );

  void listenData() async {
    todosRef.snapshots().listen((event) {
      todos.clear();
      for (var element in event.docs) {
        todos.add(element.data());
      }
      setState(() {});
    });
    // log("firestoreResult: ${firestoreResult.docs.length}");
  }

  void readData() async {
    final firestoreResult = await todosRef.get();
    for (var element in firestoreResult.docs) {
      todos.add(element.data());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const NewTodoPage(
              todo: null,
            );
          })).then((value) {
            if (value != null && value is TodoModel) {
              addToFirestore(value);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          var item = todos[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                          "Are you sure you want to delete the task?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            child: const Text("No")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              deleteFromFirestore(item);
                            },
                            child: const Text("Yes")),
                      ],
                    );
                  });
            },
            child: Card(
              child: ListTile(
                title: Text(item.title),
                subtitle: Text(item.description ?? "Not available"),
                leading: Icon(
                  Icons.done_all,
                  color: item.done == true ? Colors.green : Colors.red,
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NewTodoPage(todo: item);
                  })).then((value) {
                    if (value != null) {
                      updateToFirestore(value);
                    } else {
                      // log("returned data from new TODO page :$value");
                    }
                  });
                },
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                "Are you sure you want to complete the task?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // markAsDone(index);
                                  },
                                  child: const Text("Yes")),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.check_box_outline_blank,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
