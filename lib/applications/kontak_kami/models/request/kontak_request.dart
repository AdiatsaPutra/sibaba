class KontakRequest {
  KontakRequest({
    required this.alamat,
    required this.linkmaps,
    required this.telpon,
    required this.email,
    required this.hari1,
    required this.hari2,
    required this.masukJam,
    required this.selesaiJam,
  });

  final String alamat;
  final String linkmaps;
  final String telpon;
  final String email;
  final String hari1;
  final String hari2;
  final String masukJam;
  final String selesaiJam;

  factory KontakRequest.fromJson(Map<String, dynamic> json) => KontakRequest(
        alamat: json["Alamat"],
        linkmaps: json["Linkmaps"],
        telpon: json["Telpon"],
        email: json["Email"],
        hari1: json["Hari1"],
        hari2: json["Hari2"],
        masukJam: json["Masuk_jam"],
        selesaiJam: json["Selesai_jam"],
      );

  Map<String, dynamic> toJson() => {
        "Alamat": alamat,
        "Linkmaps": linkmaps,
        "Telpon": telpon,
        "Email": email,
        "Hari1": hari1,
        "Hari2": hari2,
        "Masuk_jam": masukJam,
        "Selesai_jam": selesaiJam,
      };
}
