import 'dart:convert';

import 'package:sibaba/core/constants.dart';
import 'package:sibaba/models/kontak_model.dart';
import 'package:sibaba/models/lokasi_detail_model.dart';
import 'package:sibaba/models/lokasi_model.dart';
import 'package:http/http.dart' as http;
import 'package:sibaba/models/tentang_model.dart';

abstract class ApiRepository {
  Future<List<LokasiModel>> getAllLokasi();
  Future<LokasiDetailModel> getDetailLokasi(String? slug);
  Future<TentangModel> getTentang();
  Future<KontakModel> getKontak();
}

class ApiRepositoryImpl extends ApiRepository {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Charset': 'utf-8'
  };

  @override
  Future<List<LokasiModel>> getAllLokasi() async {
    var response = await http.get(
      Uri.parse(baseUrl + "lokasi"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List data = json['lokasi'];
      return data.map((e) => LokasiModel.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<LokasiDetailModel> getDetailLokasi(String? slug) async {
    var response = await http.get(
      Uri.parse(baseUrl + 'lokasi/$slug'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return LokasiDetailModel.fromJson(json);
    } else {
      throw Exception();
    }
  }

  @override
  Future<TentangModel> getTentang() async {
    var response = await http.get(
      Uri.parse(baseUrl + 'tentang'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return TentangModel.fromJson(json);
    } else {
      throw Exception();
    }
  }

  @override
  Future<KontakModel> getKontak() async {
    var response = await http.get(
      Uri.parse(baseUrl + 'kontak'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var data = json['data'];
      return KontakModel.fromJson(data);
    } else {
      throw Exception();
    }
  }
}
