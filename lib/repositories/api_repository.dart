import 'dart:convert';

import 'package:sibaba/core/constants.dart';
import 'package:sibaba/models/lokasi_detail_model.dart';
import 'package:sibaba/models/lokasi_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiRepository {
  Future<List<LokasiModel>> getAllLokasi();
  Future<LokasiDetailModel> getDetailLokasi(String? slug);
}

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<List<LokasiModel>> getAllLokasi() async {
    var response = await http.get(
      Uri.parse(baseUrl + "lokasi"),
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
    var response = await http.get(Uri.parse(baseUrl + 'lokasi/$slug'));
    var json = response.body;
    print(json);
    return LokasiDetailModel.fromJson(json);
  }
}
