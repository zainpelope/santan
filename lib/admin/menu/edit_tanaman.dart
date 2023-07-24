import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:santan/config/service/api_service.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/widget/loading_dialog.dart';

class EditTanaman extends StatefulWidget {
  const EditTanaman({super.key, required this.plant});

  final Plant plant;

  @override
  State<EditTanaman> createState() => _EditTanamanState();
}

class _EditTanamanState extends State<EditTanaman> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  String _selectedSeason = 'Musim Hujan';
  XFile? _image;
  String imageNetwork = '';

  @override
  void initState() {
    _setDefault();
    super.initState();
  }

  void _setDefault() {
    nameController.text = widget.plant.name ?? '';
    descriptionController.text = widget.plant.description ?? '';
    _selectedSeason =
        widget.plant.season == 'rainy' ? 'Musim Hujan' : 'Musim Kemarau';
    imageNetwork = widget.plant.image ?? '';
  }

  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _updatePlant() async {
    _showLoading();
    final response = await ApiService.updatePlant(
      id: widget.plant.id ?? 0,
      name: nameController.text,
      description: descriptionController.text,
      season: _selectedSeason == 'Musim Hujan' ? 'rainy' : 'dry',
      image: File(_image?.path ?? ''),
    );
    _hideLoading();
    if (response) {
      _successSave();
    } else {
      _showErrorSave();
    }
  }

  void _showLoading() {
    LoadingDialog(context: context);
  }

  void _hideLoading() {
    Navigator.pop(context);
  }

  void _showErrorSave() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Gagal menambahkan tanaman'),
      ),
    );
  }

  void _successSave() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berhasil menambahkan tanaman'),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Tanaman"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 28,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      child: imageNetwork != ''
                          ? Image.network(
                              imageNetwork,
                              width: 124.w,
                              height: 124.h,
                              fit: BoxFit.cover,
                            )
                          : _image == null
                              ? const Center(
                                  child: Text('Pilih Gambar'),
                                )
                              : Image.file(
                                  File(
                                    _image?.path ?? '',
                                  ),
                                  width: 124.w,
                                  height: 124.h,
                                  fit: BoxFit.cover,
                                ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Tanaman',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedSeason,
                    onChanged: (value) {
                      setState(() {
                        _selectedSeason = value ?? '';
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Musim Hujan',
                        child: Text('Musim Hujan'),
                      ),
                      DropdownMenuItem(
                        value: 'Musim Kemarau',
                        child: Text('Musim Kemarau'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _updatePlant,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
