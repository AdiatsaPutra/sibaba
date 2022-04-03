class Ustadz {
  Ustadz({
    required this.ustadzsId,
    required this.locId,
    required this.nama,
    required this.ustadzSlug,
    required this.gender,
    required this.tmpLahir,
    required this.tglLahir,
    required this.alamat,
    required this.telpon,
    required this.email,
    required this.mulaiUstadz,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
  });

  final int ustadzsId;
  final int locId;
  final String nama;
  final String ustadzSlug;
  final String gender;
  final String tmpLahir;
  final DateTime tglLahir;
  final String alamat;
  final dynamic telpon;
  final dynamic email;
  final String mulaiUstadz;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Location location;

  factory Ustadz.fromJson(Map<String, dynamic> json) => Ustadz(
        ustadzsId: json["Ustadzs_id"],
        locId: json["Loc_id"],
        nama: json["Nama"],
        ustadzSlug: json["Ustadz_slug"],
        gender: json["Gender"],
        tmpLahir: json["Tmp_lahir"],
        tglLahir: DateTime.parse(json["Tgl_lahir"]),
        alamat: json["Alamat"],
        telpon: json["Telpon"],
        email: json["Email"],
        mulaiUstadz: json["Mulai_ustadz"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "Ustadzs_id": ustadzsId,
        "Loc_id": locId,
        "Nama": nama,
        "Ustadz_slug": ustadzSlug,
        "Gender": gender,
        "Tmp_lahir": tmpLahir,
        "Tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "Alamat": alamat,
        "Telpon": telpon,
        "Email": email,
        "Mulai_ustadz": mulaiUstadz,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "location": location.toJson(),
      };
}

class Location {
  Location({
    required this.locationId,
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
    required this.createdAt,
    required this.updatedAt,
  });

  final int locationId;
  final int userId;
  final String nspq;
  final String areaUnit;
  final String districtUnit;
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
  final dynamic tglAkreditasi;
  final String status;
  final String deskripsi;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        locationId: json["Location_id"],
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
        tglAkreditasi: json["Tgl_akreditasi"],
        status: json["Status"],
        deskripsi: json["Deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "Location_id": locationId,
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
        "Tgl_akreditasi": tglAkreditasi,
        "Status": status,
        "Deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
