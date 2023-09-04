class Barang {
  final int id;
  final String nama;
  final double harga;
  final int stok;

  Barang({
    required this.id,
    required this.nama,
    required this.harga,
    required this.stok,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'] as int,
      nama: json['nama'] as String,
      harga: json['harga'] as double,
      stok: json['stok'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'stok': stok,
    };
  }
}
