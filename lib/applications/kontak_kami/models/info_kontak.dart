import 'package:equatable/equatable.dart';

class InfoKontak extends Equatable {
  const InfoKontak({
    required this.id,
    required this.alamat,
    required this.linkmaps,
    required this.telpon,
    required this.email,
    required this.hari1,
    required this.hari2,
    required this.masukJam,
    required this.selesaiJam,
  });

  final int id;
  final String alamat;
  final String linkmaps;
  final String telpon;
  final String email;
  final String hari1;
  final String hari2;
  final String masukJam;
  final String selesaiJam;

  factory InfoKontak.fromJson(Map<String, dynamic> json) => InfoKontak(
        id: json["id"],
        alamat: json["Alamat"],
        linkmaps: json["Linkmaps"],
        telpon: json["Telpon"],
        email: json["Email"],
        hari1: json["Hari1"],
        hari2: json["Hari2"],
        masukJam: json["Masuk_jam"],
        selesaiJam: json["Selesai_jam"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Alamat": alamat,
        "Linkmaps": linkmaps,
        "Telpon": telpon,
        "Email": email,
        "Hari1": hari1,
        "Hari2": hari2,
        "Masuk_jam": masukJam,
        "Selesai_jam": selesaiJam,
      };

  @override
  List<Object?> get props => [
        id,
        alamat,
        linkmaps,
        telpon,
        email,
        hari1,
        hari2,
        masukJam,
        selesaiJam,
      ];
}
