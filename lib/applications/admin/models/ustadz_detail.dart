class DetailUstadz {
  DetailUstadz({
    required this.ustadzs,
    required this.ctglUst,
    required this.photo,
    required this.pendidikans,
    required this.pelatihans,
    required this.sertifikasis,
    required this.status,
  });

  final Ustadzs ustadzs;
  final String ctglUst;
  final Photo photo;
  final Pendidikans pendidikans;
  final Pelatihans pelatihans;
  final Sertifikasis sertifikasis;
  final Status status;

  factory DetailUstadz.fromJson(Map<String, dynamic> json) => DetailUstadz(
        ustadzs: Ustadzs.fromJson(json["ustadzs"]),
        ctglUst: json["ctglUst"],
        photo: Photo.fromJson(json["photo"]),
        pendidikans: Pendidikans.fromJson(json["pendidikans"]),
        pelatihans: Pelatihans.fromJson(json["pelatihans"]),
        sertifikasis: Sertifikasis.fromJson(json["sertifikasis"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "ustadzs": ustadzs.toJson(),
        "ctglUst": ctglUst,
        "photo": photo.toJson(),
        "pendidikans": pendidikans.toJson(),
        "pelatihans": pelatihans.toJson(),
        "sertifikasis": sertifikasis.toJson(),
        "status": status.toJson(),
      };
}

class Pelatihans {
  Pelatihans({
    required this.pelatihanId,
    required this.ustadzsId,
    required this.dasar,
    required this.mahir1,
    required this.mahir2,
    required this.tot,
    required this.createdAt,
    required this.updatedAt,
  });

  final int pelatihanId;
  final int ustadzsId;
  final String? dasar;
  final String? mahir1;
  final String? mahir2;
  final String? tot;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Pelatihans.fromJson(Map<String, dynamic> json) => Pelatihans(
        pelatihanId: json["Pelatihan_id"],
        ustadzsId: json["Ustadzs_id"],
        dasar: json["Dasar"],
        mahir1: json["Mahir1"],
        mahir2: json["Mahir2"],
        tot: json["TOT"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "Pelatihan_id": pelatihanId,
        "Ustadzs_id": ustadzsId,
        "Dasar": dasar,
        "Mahir1": mahir1,
        "Mahir2": mahir2,
        "TOT": tot,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Pendidikans {
  Pendidikans({
    required this.pendidikanId,
    required this.ustadzsId,
    this.tk = '-',
    this.tkLulus = '-',
    this.sd = '-',
    this.sdLulus = '-',
    this.smp = '-',
    this.smpLulus = '-',
    this.sma = '-',
    this.smaLulus = '-',
    this.pt = '-',
    this.ptLulus = '-',
    required this.createdAt,
    required this.updatedAt,
  });

  final int pendidikanId;
  final int ustadzsId;
  final String? tk;
  final String? tkLulus;
  final String? sd;
  final String? sdLulus;
  final String? smp;
  final String? smpLulus;
  final String? sma;
  final String? smaLulus;
  final String? pt;
  final String? ptLulus;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Pendidikans.fromJson(Map<String, dynamic> json) => Pendidikans(
        pendidikanId: json["Pendidikan_id"],
        ustadzsId: json["Ustadzs_id"],
        tk: json["TK"],
        tkLulus: json["TK_lulus"],
        sd: json["SD"],
        sdLulus: json["SD_lulus"],
        smp: json["SMP"],
        smpLulus: json["SMP_lulus"],
        sma: json["SMA"],
        smaLulus: json["SMA_lulus"],
        pt: json["PT"],
        ptLulus: json["PT_lulus"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "Pendidikan_id": pendidikanId,
        "Ustadzs_id": ustadzsId,
        "TK": tk,
        "TK_lulus": tkLulus,
        "SD": sd,
        "SD_lulus": sdLulus,
        "SMP": smp,
        "SMP_lulus": smpLulus,
        "SMA": sma,
        "SMA_lulus": smaLulus,
        "PT": pt,
        "PT_lulus": ptLulus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Photo {
  Photo({
    required this.id,
    required this.ustadzsId,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int ustadzsId;
  final String photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        ustadzsId: json["Ustadzs_id"],
        photo: json["Photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Ustadzs_id": ustadzsId,
        "Photo": photo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Sertifikasis {
  Sertifikasis({
    required this.sertifikasiId,
    required this.ustadzsId,
    required this.s1,
    required this.s2A,
    required this.s2B,
    required this.s2C,
    required this.s3,
    required this.createdAt,
    required this.updatedAt,
  });

  final int sertifikasiId;
  final int ustadzsId;
  final String? s1;
  final String? s2A;
  final String? s2B;
  final String? s2C;
  final String? s3;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Sertifikasis.fromJson(Map<String, dynamic> json) => Sertifikasis(
        sertifikasiId: json["Sertifikasi_id"],
        ustadzsId: json["Ustadzs_id"],
        s1: json["S1"],
        s2A: json["S2A"],
        s2B: json["S2B"],
        s2C: json["S2C"],
        s3: json["S3"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "Sertifikasi_id": sertifikasiId,
        "Ustadzs_id": ustadzsId,
        "S1": s1,
        "S2A": s2A,
        "S2B": s2B,
        "S2C": s2C,
        "S3": s3,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Status {
  Status({
    required this.statusId,
    required this.ustadzId,
    required this.status,
    required this.tAjar,
    required this.createdAt,
    required this.updatedAt,
  });

  final int statusId;
  final int ustadzId;
  final String status;
  final String tAjar;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        statusId: json["Status_id"],
        ustadzId: json["Ustadz_id"],
        status: json["Status"],
        tAjar: json["T_Ajar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "Status_id": statusId,
        "Ustadz_id": ustadzId,
        "Status": status,
        "T_Ajar": tAjar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Ustadzs {
  Ustadzs({
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

  factory Ustadzs.fromJson(Map<String, dynamic> json) => Ustadzs(
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
      };
}
