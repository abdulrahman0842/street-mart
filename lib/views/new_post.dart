import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:street_mart/widgets/new_post_input_data_widget.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image;

  void deleteImage() {
    File(image!.path).delete();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('NewPost'),
        ),
        body: ListView(padding: const EdgeInsets.all(8), children: [
          Container(
              height: height * 0.35,
              width: width * 0.99,
              decoration: image == null
                  ? const BoxDecoration(color: Colors.grey)
                  : BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(image!.path)))),
              child: image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Image not selected'),
                        ElevatedButton(
                            onPressed: () async {
                              XFile? file = await  _imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                image = file;
                              });
                            },
                            child: const Text('Select Image'))
                      ],
                    )
                  : Stack(children: [
                      Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                            onPressed: () {
                              image = null;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.close,
                              weight: 25,
                              color: Colors.white,
                            ),
                            style: const ButtonStyle(
                                iconSize: MaterialStatePropertyAll(25),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(81, 81, 83, 0.705))),
                          )),
                    ])),
          NewPostInputDataWidget(width: width),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.file_upload_outlined,
                size: 25,
              ),
              label: const Text(
                'Post',
                style: TextStyle(fontSize: 20),
              ))
        ]));
  }
}
