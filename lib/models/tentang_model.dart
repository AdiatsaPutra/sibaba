import 'package:equatable/equatable.dart';

class Gallery extends Equatable {
  const Gallery({
    required this.galleryId,
    required this.userId,
    required this.file,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? galleryId;
  final int? userId;
  final String? file;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Gallery.fromMap(Map<String, dynamic> json) => Gallery(
        galleryId: json["Gallery_id"],
        userId: json["User_id"],
        file: json["File"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "Gallery_id": galleryId,
        "User_id": userId,
        "File": file,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        galleryId,
        userId,
        file,
      ];
}

class Tentang extends Equatable {
  const Tentang({
    required this.id,
    required this.sejarah,
    required this.struktur,
    required this.visimisi,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? sejarah;
  final String? struktur;
  final String? visimisi;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Tentang.fromMap(Map<String, dynamic> json) => Tentang(
        id: json["id"],
        sejarah: json["Sejarah"],
        struktur: json["Struktur"],
        visimisi: json["Visimisi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Sejarah": sejarah,
        "Struktur": struktur,
        "Visimisi": visimisi,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        sejarah,
        struktur,
        visimisi,
      ];
}
