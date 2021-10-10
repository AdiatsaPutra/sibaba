import 'dart:convert';

class PostModel {
    PostModel({
        required this.lokasi,
        required this.events,
    });

    final List<Lokasi> lokasi;
    final List<dynamic> events;

    factory PostModel.fromJson(String str) => PostModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        lokasi: List<Lokasi>.from(json["lokasi"].map((x) => Lokasi.fromMap(x))),
        events: List<dynamic>.from(json["events"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "lokasi": List<dynamic>.from(lokasi.map((x) => x.toMap())),
        "events": List<dynamic>.from(events.map((x) => x)),
    };
}

class Lokasi {
    Lokasi({
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
        required this.photo,
    });

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
    final DateTime? tglAkreditasi;
    final String? status;
    final String? deskripsi;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Photo? photo;

    factory Lokasi.fromJson(String str) => Lokasi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Lokasi.fromMap(Map<String, dynamic> json) => Lokasi(
        locationId: json["Location_id"],
        userId: json["User_id"],
        nspq: json["Nspq"] == null ? null : json["Nspq"],
        areaUnit: json["Area_unit"],
        districtUnit: json["District_unit"],
        nama: json["Nama"],
        locSlug: json["Loc_slug"],
        alamat: json["Alamat"],
        telpUnit: json["Telp_unit"],
        skPendirian: json["Sk_pendirian"] == null ? null : json["Sk_pendirian"],
        tmpBelajar: json["Tmp_belajar"],
        email: json["Email"] == null ? null : json["Email"],
        akreditasi: json["Akreditasi"],
        tglBerdiri: DateTime.parse(json["Tgl_berdiri"]),
        direktur: json["Direktur"],
        tglAkreditasi: json["Tgl_akreditasi"] == null ? null : DateTime.parse(json["Tgl_akreditasi"]),
        status: json["Status"],
        deskripsi: json["Deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        photo: json["photo"] == null ? null : Photo.fromMap(json["photo"]),
    );

    Map<String, dynamic> toMap() => {
        "Location_id": locationId,
        "User_id": userId,
        "Nspq": nspq == null ? null : nspq,
        "Area_unit": areaUnit,
        "District_unit": districtUnit,
        "Nama": nama,
        "Loc_slug": locSlug,
        "Alamat": alamat,
        "Telp_unit": telpUnit,
        "Sk_pendirian": skPendirian == null ? null : skPendirian,
        "Tmp_belajar": tmpBelajar,
        "Email": email == null ? null : email,
        "Akreditasi": akreditasi,
        "Tgl_berdiri": "${tglBerdiri!.year.toString().padLeft(4, '0')}-${tglBerdiri!.month.toString().padLeft(2, '0')}-${tglBerdiri!.day.toString().padLeft(2, '0')}",
        "Direktur": direktur,
        "Tgl_akreditasi": tglAkreditasi == null ? null : "${tglAkreditasi!.year.toString().padLeft(4, '0')}-${tglAkreditasi!.month.toString().padLeft(2, '0')}-${tglAkreditasi!.day.toString().padLeft(2, '0')}",
        "Status": status,
        "Deskripsi": deskripsi,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "photo": photo == null ? null : photo!.toMap(),
    };
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

    factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Photo.fromMap(Map<String, dynamic> json) => Photo(
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
