import 'package:equatable/equatable.dart';

class LocationRequest extends Equatable {
  const LocationRequest({
    required this.userId,
    required this.nspq,
    required this.areaUnit,
    required this.districtUnit,
    required this.nama,
    required this.locSlug,
    required this.alamat,
    required this.telpUnit,
    required this.skPendirian,
    required this.tmpBelajar,
    required this.email,
    required this.akreditasi,
    required this.tglBerdiri,
    required this.direktur,
    required this.tglAkreditasi,
    required this.status,
    required this.deskripsi,
    required this.hariMasuk,
    required this.masuk,
    required this.selesai,
    required this.latitude,
    required this.longitude,
  });

  final String userId;
  final String nspq;
  final int areaUnit;
  final int districtUnit;
  final String nama;
  final String locSlug;
  final String alamat;
  final String telpUnit;
  final String skPendirian;
  final String tmpBelajar;
  final String email;
  final String akreditasi;
  final DateTime tglBerdiri;
  final String direktur;
  final DateTime tglAkreditasi;
  final String status;
  final String deskripsi;
  final String hariMasuk;
  final String masuk;
  final String selesai;
  final String latitude;
  final String longitude;

  factory LocationRequest.fromMap(Map<String, dynamic> json) => LocationRequest(
        userId: json["User_id"],
        nspq: json["Nspq"],
        areaUnit: json["Area_unit"],
        districtUnit: json["District_unit"],
        nama: json["Nama"],
        locSlug: json["Loc_slug"],
        alamat: json["Alamat"],
        telpUnit: json["Telp_unit"],
        skPendirian: json["Sk_pendirian"],
        tmpBelajar: json["Tmp_belajar"],
        email: json["Email"],
        akreditasi: json["Akreditasi"],
        tglBerdiri: DateTime.parse(json["Tgl_berdiri"]),
        direktur: json["Direktur"],
        tglAkreditasi: DateTime.parse(json["Tgl_akreditasi"]),
        status: json["Status"],
        deskripsi: json["Deskripsi"],
        hariMasuk: json["Hari_masuk"],
        masuk: json["Masuk"],
        selesai: json["Selesai"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
      );

  Map<String, dynamic> toJson() => {
        "User_id": userId,
        "Nspq": nspq,
        "Area_unit": areaUnit,
        "District_unit": districtUnit,
        "Nama": nama,
        "Loc_slug": locSlug,
        "Alamat": alamat,
        "Telp_unit": telpUnit,
        "Sk_pendirian": skPendirian,
        "Tmp_belajar": tmpBelajar,
        "Email": email,
        "Akreditasi": akreditasi,
        "Tgl_berdiri":
            "${tglBerdiri.year.toString().padLeft(4, '0')}-${tglBerdiri.month.toString().padLeft(2, '0')}-${tglBerdiri.day.toString().padLeft(2, '0')}",
        "Direktur": direktur,
        "Tgl_akreditasi":
            "${tglAkreditasi.year.toString().padLeft(4, '0')}-${tglAkreditasi.month.toString().padLeft(2, '0')}-${tglAkreditasi.day.toString().padLeft(2, '0')}",
        "Status": status,
        "Deskripsi": deskripsi,
        "Hari_masuk": hariMasuk,
        "Masuk": masuk,
        "Selesai": selesai,
        "Latitude": latitude,
        "Longitude": longitude,
      };

  @override
  List<Object?> get props => [
        userId,
        nspq,
        areaUnit,
        districtUnit,
        nama,
        locSlug,
        alamat,
        telpUnit,
        skPendirian,
        tmpBelajar,
        email,
        akreditasi,
        tglBerdiri,
        direktur,
        tglAkreditasi,
        status,
        deskripsi,
        hariMasuk,
        masuk,
        selesai,
        latitude,
        longitude,
      ];
}
