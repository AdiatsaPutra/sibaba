import 'package:equatable/equatable.dart';

class Kapanewon extends Equatable {
  const Kapanewon({
    required this.areaId,
    required this.areaName,
    required this.kodeArea,
    required this.createdAt,
    required this.updatedAt,
  });

  final int areaId;
  final String areaName;
  final String kodeArea;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Kapanewon.fromMap(Map<String, dynamic> json) => Kapanewon(
        areaId: json["Area_id"],
        areaName: json["area_name"],
        kodeArea: json["kode_area"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "Area_id": areaId,
        "area_name": areaName,
        "kode_area": kodeArea,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        areaId,
        areaName,
        kodeArea,
        createdAt,
        updatedAt,
      ];
}
