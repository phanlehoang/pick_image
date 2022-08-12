import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
class ImageView extends StatefulWidget {
  const ImageView({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final imagePicker = ImagePicker();
  File? _image;

  void pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void captureImage() async {
    final capturedImageFile =
    await imagePicker.pickImage(source: ImageSource.camera);
    if (capturedImageFile != null) {
      setState(() {
        _image = File(capturedImageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: _image == null
              ? const Center(child: Text('No image selected.'))
              : Image.file(_image!, fit: BoxFit.fill),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: pickImageFromGallery,
                child: const Text("Pick Image"),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: captureImage,
                child: const Text("Take Photo"),
              )
            ],
          ),
        )
      ],
    );
  }
}