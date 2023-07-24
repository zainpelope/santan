import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santan/admin/menu/edit_tanaman.dart';
import 'package:santan/admin/menu/tambah_tanaman.dart';
import 'package:santan/config/service/api_service.dart';
import 'package:santan/home/home.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/utils/extension/extension.dart';
import 'package:santan/widget/loading_dialog.dart';
import '../../config/theme/app_color.dart';
import '../../config/theme/app_font.dart';

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

  //function
 String aku (){
    String a = "2";
    return a;
 }
 int kamu (){
    return 2;
 }
 bool dia (){
    return true;
 }

 //variable
 int mobil = 2;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.green,
        title: Text(
          "Daftar Tanaman",
          style: AppFont.judul,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ],
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(plant.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 100,
                width: 100,
              ),
              15.0.width,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.name ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.teks,
                      ),
                    ),
                    10.0.height,
                    Text(
                      plant.description ?? '',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
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
              10.0.width,
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
