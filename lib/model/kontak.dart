// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals

class Kontak {
  int? id;
  String? name;
  String? email;
  String? telepon;

  Kontak({this.id, this.name, this.email, this.telepon});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['email'] = email;
    map['telepon'] = telepon;

    return map;
  }

  Kontak.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.telepon = map['telepon'];
  }
}
