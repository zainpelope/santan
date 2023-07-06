class Tanaman {
  final int id;
  final String nama;
  final String deskripsi;
  final String gambar;

  Tanaman({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.gambar,
  });

  factory Tanaman.fromJson(Map<String, dynamic> json) {
    return Tanaman(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
    );
  }
}
