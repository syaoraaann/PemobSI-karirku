// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, annotate_overrides, prefer_final_fields, unused_field

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karirku/dto/datascustomer.dart';
import 'package:karirku/screens/routes/DatasScreen/customer_screen.dart';
import 'package:karirku/services/data_service.dart';

class CustomerEdit extends StatefulWidget {
  final CustomerService dataEdit;

  const CustomerEdit({Key? key, required this.dataEdit}) : super(key: key);

  @override
  _CustomerEditState createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
  late TextEditingController _titleController;
  late TextEditingController _detailController;
  late TextEditingController _ratingController;
  int _rating = 0;

  File? galleryFile;
  final picker = ImagePicker();

  _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.dataEdit.titleIssues);
    _detailController =
        TextEditingController(text: widget.dataEdit.descriptionIssues);
    _ratingController =
        TextEditingController(text: widget.dataEdit.rating.toString());
  }

  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  Future<void> _updateCustomer() async {
    try {
      final updatedData = await DataService.updateCustomer(
        widget.dataEdit.idCustomerService,
        _titleController.text,
        _detailController.text,
        int.parse(_ratingController.text),
        galleryFile!.path,
      );
      // Refresh the data in the DatasScreen
      Navigator.pop(context, updatedData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data updated successfully'),
        ),
      );
    } catch (e) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerServiceScreen(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update data: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Form'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  // SizedBox(height: 5),
                  TextField(
                    controller: _detailController,
                    decoration: InputDecoration(
                      labelText: 'Detail',
                    ),
                    // maxLines: 5,
                  ),
                  // SizedBox(height: 5),
                  TextField(
                    controller: _ratingController,
                    decoration: InputDecoration(
                      labelText: 'Rating',
                    ),
                    // maxLines: 5,
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      _showPicker(context: context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: galleryFile == null
                          ? Row(
                              children: [
                                Icon(Icons.add_photo_alternate_outlined),
                                SizedBox(width: 10),
                                Text('Choose Updated Picture'),
                              ],
                            )
                          : Center(
                              child: Image.file(galleryFile!),
                            ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // if (_image != null)
                  //   Image.file(
                  //     _image!,
                  //     width: 200,
                  //     height: 200,
                  //   ),
                  // SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                      // For example, you can print the entered values for now
                      _updateCustomer();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal), // Set background color to teal
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
