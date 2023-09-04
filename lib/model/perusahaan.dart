class Perusahaan {
  final int id;
  final String nama;
  final String alamat;

  Perusahaan({
    required this.id,
    required this.nama,
    required this.alamat,
  });

  factory Perusahaan.fromJson(Map<String, dynamic> json) {
    return Perusahaan(
      id: json['id'] as int,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'alamat': alamat,
    };
  }
}
