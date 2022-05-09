import 'package:equatable/equatable.dart';

class Kelurahan extends Equatable {
  const Kelurahan({
    required this.districtId,
    required this.areaId,
    required this.districtName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int districtId;
  final int areaId;
  final String districtName;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        districtId: json["District_id"],
        areaId: json["Area_id"],
        districtName: json["district_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "District_id": districtId,
        "Area_id": areaId,
        "district_name": districtName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        districtId,
        areaId,
        districtName,
        createdAt,
        updatedAt,
      ];
}
