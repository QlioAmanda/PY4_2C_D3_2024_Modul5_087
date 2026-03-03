// Nama : Qlio Amanda Febriany | Nim : 241511087 | Kelas : 2C
import 'package:mongo_dart/mongo_dart.dart';

class LogModel {
  final ObjectId? id; 
  final String title;
  final String date;
  final String description;
  final String category;
  final String author; // Menambahkan pembuat catatan

  LogModel({
    this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.category,
    required this.author, // Wajib diisi saat membuat LogModel
  });

  // Konversi dari Cloud (BSON) ke Aplikasi
  factory LogModel.fromMap(Map<String, dynamic> map) {
    return LogModel(
      id: map['_id'] as ObjectId?, 
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? 'Pekerjaan',
      author: map['author'] ?? 'Unknown', //Ambil dari Mongo, default 'Unknown' jika kosong
    );
  }

  // Konversi dari Aplikasi ke Cloud (BSON)
  Map<String, dynamic> toMap() {
    return {
      if (id != null) '_id': id,
      'title': title,
      'date': date,
      'description': description,
      'category': category,
      'author': author, // Simpan ke Mongo
    };
  }
}