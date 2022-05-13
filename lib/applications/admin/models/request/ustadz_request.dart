class UstadzRequest {
  UstadzRequest({
    required this.userId,
    required this.locationName,
    required this.nama,
    required this.gender,
    required this.tmpLahir,
    required this.tglLahir,
    required this.alamat,
    required this.telpon,
    required this.email,
    required this.mulaiUstadz,
    required this.status,
    required this.tAjar,
    required this.tk,
    required this.tkLulus,
    required this.sd,
    required this.sdLulus,
    required this.smp,
    required this.smpLulus,
    required this.sma,
    required this.smaLulus,
    required this.pt,
    required this.ptLulus,
    required this.dasar,
    required this.mahir1,
    required this.mahir2,
    required this.tot,
    required this.s1,
    required this.s2A,
    required this.s2B,
    required this.s2C,
    required this.s3,
  });

  final int userId;
  final String locationName;
  final String nama;
  final String gender;
  final String tmpLahir;
  final String tglLahir;
  final String alamat;
  final String telpon;
  final String email;
  final String mulaiUstadz;
  final String status;
  final String tAjar;
  final String tk;
  final String tkLulus;
  final String sd;
  final String sdLulus;
  final String smp;
  final String smpLulus;
  final String sma;
  final String smaLulus;
  final String pt;
  final String ptLulus;
  final String dasar;
  final String mahir1;
  final String mahir2;
  final String tot;
  final String s1;
  final String s2A;
  final String s2B;
  final String s2C;
  final String s3;

  Map<String, dynamic> toJson() => {
        "User_id": userId == null ? null : userId,
        "Location_name": locationName == null ? null : locationName,
        "Nama": nama == null ? null : nama,
        "Gender": gender == null ? null : gender,
        "Tmp_lahir": tmpLahir == null ? null : tmpLahir,
        "Tgl_lahir": tglLahir == null ? null : tglLahir,
        "Alamat": alamat == null ? null : alamat,
        "Telpon": telpon == null ? null : telpon,
        "Email": email == null ? null : email,
        "Mulai_ustadz": mulaiUstadz == null ? null : mulaiUstadz,
        "Status": status == null ? null : status,
        "T_Ajar": tAjar == null ? null : tAjar,
        "TK": tk == null ? null : tk,
        "TK_lulus": tkLulus == null ? null : tkLulus,
        "SD": sd == null ? null : sd,
        "SD_lulus": sdLulus == null ? null : sdLulus,
        "SMP": smp == null ? null : smp,
        "SMP_lulus": smpLulus == null ? null : smpLulus,
        "SMA": sma == null ? null : sma,
        "SMA_lulus": smaLulus == null ? null : smaLulus,
        "PT": pt == null ? null : pt,
        "PT_lulus": ptLulus == null ? null : ptLulus,
        "Dasar": dasar == null ? null : dasar,
        "Mahir1": mahir1 == null ? null : mahir1,
        "Mahir2": mahir2 == null ? null : mahir2,
        "TOT": tot == null ? null : tot,
        "S1": s1 == null ? null : s1,
        "S2A": s2A == null ? null : s2A,
        "S2B": s2B == null ? null : s2B,
        "S2C": s2C == null ? null : s2C,
        "S3": s3 == null ? null : s3,
      };
}
