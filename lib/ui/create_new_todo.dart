import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_todo/models/todo_model.dart';
import 'package:flutter/cupertino.dart';
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
  bool uploading = false;

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
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        uploadImage(image);
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Icons.camera_alt,
                          size: 35,
                        ),
                        Text("Camera"),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      uploadImage(image);
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        height: 15,
                      ),
                      Icon(
                        Icons.photo_outlined,
                        size: 35,
                      ),
                      Text("Gallery"),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void uploadImage(XFile file) async {
    UploadTask uploadTask;
    var newId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child('$newId.jpg');
    uploadTask = ref.putFile(File(file.path));
    uploading = true;
    setState(() {});
    uploadTask.then((p0) async {
      if (p0.state == TaskState.success) {
        final url = await ref.getDownloadURL();
        imageUrl = url;
        setState(() {
          uploading = false;
        });
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
              SizedBox(
                height: 150,
                child: uploading
                    ? const CupertinoActivityIndicator()
                    : IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: const Icon(Icons.add_a_photo_outlined),
                      ),
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
                if (uploading) {
                  return;
                }
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
              child: uploading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    )
                  : Text(widget.todo == null ? "Create" : "Update"),
            ),
          ],
        ),
      ),
    );
  }
}
