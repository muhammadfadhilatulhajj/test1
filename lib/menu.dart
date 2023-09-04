import 'package:flutter/material.dart';
import 'package:flutter_contact/list_barang.dart';
import 'package:flutter_contact/list_kontak.dart';
import 'package:flutter_contact/list_perusahaan.dart';
import 'package:flutter_contact/list_transaksi.dart';

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Page',
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns
        padding: EdgeInsets.all(16.0),
        children: [
          MenuItemBox(
            title: 'User',
            color: Colors.blue,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListKontakPage()));
              print('Item 1 clicked');
            },
          ),
          MenuItemBox(
            title: 'perusahaan',
            color: Colors.green,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListPerusahaan()));
              print('Item 2 clicked');
            },
          ),
          MenuItemBox(
            title: 'barang',
            color: Colors.orange,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListBarang()));
              print('Item 3 clicked');
            },
          ),
          MenuItemBox(
            title: 'transaksi',
            color: Colors.red,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListTransaksi()));
              print('Item 4 clicked');
            },
          ),
          MenuItemBox(
            title: 'report',
            color: Colors.red,
            onTap: () {
              // Handle the click for Item 4 here
              print('Item 4 clicked');
            },
          ),
        ],
      ),
    );
  }
}

class MenuItemBox extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  MenuItemBox({required this.title, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: color,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
