import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santan/admin/menu/edit_tanaman.dart';
import 'package:santan/admin/menu/tambah_tanaman.dart';
import 'package:santan/config/service/api_service.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/widget/loading_dialog.dart';

class MenuAdmin extends StatefulWidget {
  const MenuAdmin({Key? key}) : super(key: key);

  @override
  State<MenuAdmin> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  List<Plant> listPlant = [];

  void _requestPlants() async {
    final plants = await ApiService.getAllPlant();
    setState(() {
      listPlant = plants;
    });
  }

  void _removePlant(num id) async {
    _showLoading();
    final isSuccess = await ApiService.removePlant(id: id);
    _hideLoading();
    if (isSuccess) {
      _requestPlants();
    } else {
      _showErrorDelete();
    }
  }

  void _showErrorDelete() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Gagal menghapus tanaman'),
      ),
    );
  }

  void _showLoading() {
    LoadingDialog(context: context);
  }

  void _hideLoading() {
    Navigator.pop(context);
  }

  void _navigateToAddPlant() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TambahTanaman(),
      ),
    );
  }

  @override
  void initState() {
    _requestPlants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Tanaman"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddPlant,
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _requestPlants();
        },
        child: ListView.builder(
          itemCount: listPlant.length,
          itemBuilder: (context, index) {
            final plant = listPlant[index];
            return _plantItem(plant);
          },
        ),
      ),
    );
  }

  Widget _plantItem(Plant plant) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.network(
                plant.image ?? '',
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.name ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      plant.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () => _removePlant(plant.id ?? 0),
                  child: const Text('Hapus'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _navigateToEditPlant(plant),
                  child: const Text('Edit'),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _navigateToEditPlant(Plant plant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTanaman(plant: plant),
      ),
    );
  }
}
