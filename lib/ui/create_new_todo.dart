import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_todo/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewTodoPage extends StatefulWidget {
  final TodoModel? todo;
  const NewTodoPage({super.key, required this.todo});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool complete = false;

  final ImagePicker _picker = ImagePicker();
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    checkPassedData();
  }

  void checkPassedData() {
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      descriptionController.text = widget.todo!.description ?? "";
      complete = widget.todo!.done;
      imageUrl = widget.todo!.image;
    }
  }

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      uploadImage(image);
    }
  }

  void uploadImage(XFile file) async {
    UploadTask uploadTask;
    var newId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child('$newId.jpg');
    uploadTask = ref.putFile(File(file.path));
    uploadTask.then((p0) async {
      if (p0.state == TaskState.success) {
        final url = await ref.getDownloadURL();
        imageUrl = url;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo == null ? "Create a new TODO" : "Update TODO"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                height: 150,
              )
            else
              IconButton(
                onPressed: () {
                  pickImage();
                },
                icon: const Icon(Icons.add_a_photo_outlined),
              ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text("Completed:"),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    complete = !complete;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.verified_user,
                    color: complete ? Colors.green : Colors.yellow[600],
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                var newId = DateTime.now().millisecondsSinceEpoch.toString();
                if (widget.todo != null) {
                  newId = widget.todo!.id;
                }
                TodoModel newItem = TodoModel(
                  id: newId,
                  title: titleController.text,
                  description: descriptionController.text,
                  done: complete,
                  image: imageUrl,
                );
                titleController.text = "";
                descriptionController.text = "";
                Navigator.of(context).pop(newItem);
              },
              child: Text(widget.todo == null ? "Create" : "Update"),
            ),
          ],
        ),
      ),
    );
  }
}
