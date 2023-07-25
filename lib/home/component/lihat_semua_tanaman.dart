import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/detail_tanaman.dart';
import '../../config/service/api_service.dart';
import '../../models/tanaman/plant.dart';

class SemuaTanaman extends StatefulWidget {
  const SemuaTanaman({Key? key}) : super(key: key);

  @override
  State<SemuaTanaman> createState() => _SemuaTanamanState();
}

class _SemuaTanamanState extends State<SemuaTanaman> {
  bool _isSearchVisible = false;
  String _searchQuery = '';
  List<Plant> _plants = [];

  @override
  void initState() {
    super.initState();
    _fetchPlants();
  }

  Future<void> _fetchPlants() async {
    try {
      List<Plant> plants = await ApiService.getAllPlant();
      plants.sort((a, b) => a.name!.compareTo(b.name!));

      if (_searchQuery.isNotEmpty) {
        plants = plants
            .where((plant) =>
            plant.name!.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
      }

      setState(() {
        _plants = plants;
      });
    } catch (e) {
      print('Error fetching plants: $e');
    }
  }

  void _toggleSearchBarVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        // Clear the search query and show all plants again
        _searchQuery = '';
        _fetchPlants();
      }
    });
  }

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
      _fetchPlants();
    });
  }

  @override
  Widget build(BuildContext context) {
    _plants.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));

    return Scaffold(
      backgroundColor: AppColor.green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.green,
        title: _isSearchVisible
            ? TextField(
          onChanged: _performSearch,
          style: AppFont.judul,
          decoration: InputDecoration(
            hintText: 'Cari Tanaman...',
            hintStyle: AppFont.pencarian,
            border: InputBorder.none,
          ),
        )
            : Text(
          "Semua Tanaman",
          style: AppFont.judul,
        ),
        elevation: 3,
        actions: [
          IconButton(
            onPressed: _toggleSearchBarVisibility,
            icon: Icon(_isSearchVisible ? Icons.cancel : Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<Plant>>(
        future: ApiService.getAllPlant(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.hari,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Periksa Koneksi Anda!',
                style: AppFont.hari.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            final List<Plant> data = _plants;
            return GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                  color: AppColor.hari,
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTanaman(
                                  namePlant: data[index].name ?? '',
                                  imagePlant: data[index].image ?? '',
                                  descriptionPlant:
                                  data[index].description ?? '',
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              top: AppDimen.h2,
                              right: AppDimen.w2,
                              left: AppDimen.w2,
                              bottom: AppDimen.h4,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  data[index].image ?? '',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        data[index].name ?? "",
                        style: AppFont.hari,
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
