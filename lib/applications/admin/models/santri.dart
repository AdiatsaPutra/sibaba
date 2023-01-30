import 'dart:convert';

class Santri {
  Santri({
    required this.id,
    required this.locId,
    required this.wilayah,
    required this.unit,
    required this.tahunAjaran,
    required this.file,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int locId;
  final String wilayah;
  final String unit;
  final String tahunAjaran;
  final String file;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Santri.fromRawJson(String str) => Santri.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Santri.fromJson(Map<String, dynamic> json) => Santri(
        id: json["id"],
        locId: json["Loc_id"],
        wilayah: json["Wilayah"],
        unit: json["Unit"],
        tahunAjaran: json["Tahun_ajaran"],
        file: json["File"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Loc_id": locId,
        "Wilayah": wilayah,
        "Unit": unit,
        "Tahun_ajaran": tahunAjaran,
        "File": file,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
