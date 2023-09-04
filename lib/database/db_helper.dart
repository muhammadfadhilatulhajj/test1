import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();

  factory DbHelper() => _instance;

  DbHelper.internal();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'your_database_name.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await createKontakTable(db);
        await createPerusahaanTable(db);
        await createBarangTable(db);
        await createTransaksiTable(db);
        await createReportTable(db);
      },
    );
  }

  Future<void> createKontakTable(Database db) async {
    await db.execute(
        '''
      CREATE TABLE kontak (
        id INTEGER PRIMARY KEY,
        nama TEXT,
        email TEXT,
        telepon TEXT
      )
    ''');
  }

  Future<void> createPerusahaanTable(Database db) async {
    await db.execute(
        '''
      CREATE TABLE perusahaan (
        id INTEGER PRIMARY KEY,
        nama TEXT,
        alamat TEXT
      )
    ''');
  }

  Future<void> createBarangTable(Database db) async {
    await db.execute(
        '''
      CREATE TABLE barang (
        id INTEGER PRIMARY KEY,
        nama TEXT,
        harga REAL,
        stok INTEGER
      )
    ''');
  }

  Future<void> createTransaksiTable(Database db) async {
    await db.execute(
        '''
      CREATE TABLE transaksi (
        id INTEGER PRIMARY KEY,
        tanggal_transaksi TEXT,
        user_id INTEGER,
        barang_id INTEGER,
        jumlah_barang INTEGER,
        total_harga REAL
      )
    ''');
  }

  Future<void> createReportTable(Database db) async {
    await db.execute(
        '''
      CREATE TABLE report (
        id INTEGER PRIMARY KEY,
        transaksi_id INTEGER,
        keterangan TEXT
      )
    ''');
  }

  // CRUD methods for kontak
  Future<int> insertKontak(Map<String, dynamic> kontak) async {
    final db = await database;
    return await db.insert('kontak', kontak);
  }

  Future<List<Map<String, dynamic>>> getKontakList() async {
    final db = await database;
    return await db.query('kontak');
  }

  Future<int> updateKontak(Map<String, dynamic> kontak) async {
    final db = await database;
    return await db
        .update('kontak', kontak, where: 'id = ?', whereArgs: [kontak['id']]);
  }

  Future<int> deleteKontak(int id) async {
    final db = await database;
    return await db.delete('kontak', where: 'id = ?', whereArgs: [id]);
  }

  // Similar CRUD methods for perusahaan, barang, transaksi, and report tables...
}
