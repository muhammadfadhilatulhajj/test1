class Transaksi {
  final int id;
  final DateTime tanggalTransaksi;
  final int userId;
  final int barangId;
  final int jumlahBarang;
  final double totalHarga;

  Transaksi({
    required this.id,
    required this.tanggalTransaksi,
    required this.userId,
    required this.barangId,
    required this.jumlahBarang,
    required this.totalHarga,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      id: json['id'] as int,
      tanggalTransaksi: DateTime.parse(json['tanggal_transaksi'] as String),
      userId: json['user_id'] as int,
      barangId: json['barang_id'] as int,
      jumlahBarang: json['jumlah_barang'] as int,
      totalHarga: json['total_harga'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tanggal_transaksi': tanggalTransaksi.toIso8601String(),
      'user_id': userId,
      'barang_id': barangId,
      'jumlah_barang': jumlahBarang,
      'total_harga': totalHarga,
    };
  }
}
