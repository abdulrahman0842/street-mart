import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:street_mart/models/new_product_model.dart';
import 'package:street_mart/services/share_new_product.dart';
import 'dart:io';
import 'package:street_mart/widgets/new_post_text_field.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image;

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
                  ? BoxDecoration(color: Colors.grey.shade300)
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
                            onPressed: () {
                              pickImageDialog(height);
                            },
                            child: const Text('Pick an Image'))
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
                                iconSize: WidgetStatePropertyAll(25),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(81, 81, 83, 0.705))),
                          )),
                    ])),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Product Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                NewPostTextField(
                  controller: productNameController,
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                DropdownMenu(
                    controller: productCategoryController,
                    initialSelection: 'Default',
                    
                    menuStyle: const MenuStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))))),
                    hintText: 'Category',
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(
                        value: 'Default',
                        label: 'Default',
                      ),
                      DropdownMenuEntry(
                        value: 'Stationary',
                        label: 'Stationary',
                      ),
                      DropdownMenuEntry(value: 'Fashion', label: 'Fashion'),
                      DropdownMenuEntry(
                          value: 'Electronics', label: 'Electronics'),
                      DropdownMenuEntry(value: 'Hardware', label: 'Hardware')
                    ]),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                NewPostTextField(
                  controller: addressController,
                  hintText: 'Location',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: postProduct,
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

  void postProduct() {
    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please pick an Image First!')));
    }

    if (_formKey.currentState!.validate() && image != null) {
      NewProductModel newProduct = NewProductModel(
          productName: productNameController.text,
          productCategory: productCategoryController.text,
          locationCoordinates: addressController.text);
      ShareNewProductService().shareNewProduct(newProduct, image!);

      productNameController.clear();
      productCategoryController.clear();
      addressController.clear();
      setState(() {
        image = null;
      });
    }
  }

  pickImageDialog(double height) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
            title: const Text('Pick Image'),
            content: SizedBox(
              height: height * 0.15,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        XFile? file = await _imagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          image = file;
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Pick Image from Gallery')),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        XFile? file = await _imagePicker.pickImage(
                            source: ImageSource.camera);
                        setState(() {
                          image = file;
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Pick Image from Camera'))
                ],
              ),
            ));
      },
    );
  }
}
