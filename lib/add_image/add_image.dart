import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage(this.addImage, {super.key});
  final Function(File image) addImage;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? pickedImage;
  void pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageXFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50, //중간
        maxHeight: 150);
    setState(() {
      if (pickedImageXFile != null)
        pickedImage = File(pickedImageXFile.path); //XFile -> File
      widget.addImage(pickedImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 300,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            backgroundImage:
                pickedImage != null ? FileImage(pickedImage!) : null,
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            icon: const Icon(Icons.image),
            label: const Text('Add image'),
            onPressed: () {
              pickImage();
            },
          ),
          const SizedBox(height: 80),
          TextButton.icon(
            icon: const Icon(Icons.close),
            label: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
