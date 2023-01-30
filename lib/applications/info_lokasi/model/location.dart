class Location {
  Location({
    required this.lokasi,
    required this.maps,
    required this.events,
  });

  final List<Lokasi> lokasi;
  final List<MapElement> maps;
  final List<dynamic> events;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lokasi:
            List<Lokasi>.from(json["lokasi"].map((x) => Lokasi.fromJson(x))),
        maps: List<MapElement>.from(
            json["maps"].map((x) => MapElement.fromJson(x))),
        events: List<dynamic>.from(json["events"].map((x) => x)),
      );
}

class Lokasi {
  Lokasi(
      {this.locationId,
      this.userId,
      this.nspq,
      this.areaUnit,
      this.districtUnit,
      this.nama,
      this.locSlug,
      this.alamat,
      this.telpUnit,
      this.skPendirian,
      this.tmpBelajar,
      this.email,
      this.akreditasi,
      this.tglBerdiri,
      this.direktur,
      this.tglAkreditasi,
      this.status,
      this.deskripsi,
      this.createdAt,
      this.updatedAt,
      this.photo});

  final int? locationId;
  final int? userId;
  final String? nspq;
  final String? areaUnit;
  final String? districtUnit;
  final String? nama;
  final String? locSlug;
  final String? alamat;
  final String? telpUnit;
  final String? skPendirian;
  final String? tmpBelajar;
  final String? email;
  final String? akreditasi;
  final DateTime? tglBerdiri;
  final String? direktur;
  final String? tglAkreditasi;
  final String? status;
  final String? deskripsi;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Photo? photo;

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
        locationId: json["Location_id"],
        userId: json["User_id"],
        nspq: json["Nspq"],
        areaUnit: json["Area_unit"],
        districtUnit:
            json["District_unit"],
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
        tglAkreditasi:
            json["Tgl_akreditasi"],
        status: json["Status"],
        deskripsi: json["Deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
      );
}

class Photo {
  Photo({
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

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        locId: json["Loc_id"],
        fileLoc: json["File_loc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Loc_id": locId,
        "File_loc": fileLoc,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class MapElement {
  MapElement({
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

  factory MapElement.fromJson(Map<String, dynamic> json) => MapElement(
        mapsId: json["Maps_id"],
        locId: json["Loc_id"],
        latitude: json["Latitude"] == null ? null : json["Latitude"].toDouble(),
        longitude:
            json["Longitude"] == null ? null : json["Longitude"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "Maps_id": mapsId,
        "Loc_id": locId,
        "Latitude": latitude,
        "Longitude": longitude,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
