class LocationDetail {
  LocationDetail({
    required this.foto,
    required this.maps,
    required this.waktuMasuk,
    required this.waktuSelesai,
    required this.detailLokasi,
    required this.ustadzs,
  });

  final List<Foto> foto;
  final Maps maps;
  final String waktuMasuk;
  final String waktuSelesai;
  final DetailLokasiData detailLokasi;
  final List<Ustadz> ustadzs;

  factory LocationDetail.fromMap(Map<String, dynamic> json) => LocationDetail(
        foto: List<Foto>.from(json["foto"].map((x) => Foto.fromMap(x))),
        maps: Maps.fromMap(json["maps"]),
        waktuMasuk: json["waktu-masuk"],
        waktuSelesai: json["waktu-selesai"],
        detailLokasi: DetailLokasiData.fromMap(json["detail-lokasi"]),
        ustadzs:
            List<Ustadz>.from(json["ustadzs"].map((x) => Ustadz.fromMap(x))),
      );
}

class DetailLokasiData {
  DetailLokasiData({
    required this.locationId,
    required this.userId,
    this.nspq,
    required this.areaUnit,
    required this.districtUnit,
    required this.nama,
    required this.locSlug,
    required this.alamat,
    this.telpUnit,
    this.skPendirian,
    required this.tmpBelajar,
    this.email,
    required this.akreditasi,
    required this.tglBerdiri,
    required this.direktur,
    this.tglAkreditasi = '',
    required this.status,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  final int locationId;
  final int userId;
  final String? nspq;
  final String areaUnit;
  final String districtUnit;
  final String nama;
  final String locSlug;
  final String alamat;
  final String? telpUnit;
  final String? skPendirian;
  final String tmpBelajar;
  final String? email;
  final String akreditasi;
  final DateTime? tglBerdiri;
  final String direktur;
  final dynamic tglAkreditasi;
  final String status;
  final String deskripsi;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DetailLokasiData.fromMap(Map<String, dynamic> json) =>
      DetailLokasiData(
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
}

class Foto {
  Foto({
    required this.id,
    required this.locId,
    required this.fileLoc,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int locId;
  final String fileLoc;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Foto.fromMap(Map<String, dynamic> json) => Foto(
        id: json["id"],
        locId: json["Loc_id"],
        fileLoc: json["File_loc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Loc_id": locId,
        "File_loc": fileLoc,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Maps {
  Maps({
    required this.mapsId,
    required this.locId,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  final int mapsId;
  final int locId;
  final double latitude;
  final double longitude;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Maps.fromMap(Map<String, dynamic> json) => Maps(
        mapsId: json["Maps_id"],
        locId: json["Loc_id"],
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "Maps_id": mapsId,
        "Loc_id": locId,
        "Latitude": latitude,
        "Longitude": longitude,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

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
    this.telpon,
    this.email,
    required this.mulaiUstadz,
    required this.createdAt,
    required this.updatedAt,
  });

  final int ustadzsId;
  final int locId;
  final String nama;
  final String ustadzSlug;
  final String gender;
  final String tmpLahir;
  final DateTime tglLahir;
  final String alamat;
  final String? telpon;
  final String? email;
  final String mulaiUstadz;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Ustadz.fromMap(Map<String, dynamic> json) => Ustadz(
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
      );

  Map<String, dynamic> toMap() => {
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
      };
}
