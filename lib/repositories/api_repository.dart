import 'dart:convert';

import 'package:sibaba/core/constants.dart';
import 'package:sibaba/models/lokasi_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiRepository {
  Future<List<LokasiModel>> getLokasi();
}

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<List<LokasiModel>> getLokasi() async {
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
}
