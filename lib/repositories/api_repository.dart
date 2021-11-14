import 'dart:convert';

import 'package:sibaba/core/constants.dart';
import 'package:sibaba/models/kapanewon_model.dart';
import 'package:sibaba/models/kontak_model.dart';
import 'package:sibaba/models/lokasi_detail_model.dart';
import 'package:sibaba/models/lokasi_model.dart';
import 'package:http/http.dart' as http;
import 'package:sibaba/models/message_model.dart';
import 'package:sibaba/models/tentang_model.dart';
import 'package:sibaba/models/user_model.dart';

abstract class ApiRepository {
  Future<List<LokasiModel>> getAllLokasi();
  Future<LokasiDetailModel> getDetailLokasi(String? slug);
  Future<TentangModel> getTentang();
  Future<KontakModel> getKontak();
  Future<List<UserModel>> getUsers();
  Future<List<MessageModel>> getMessages();
  Future<List<KapanewonModel>> getKapanewon();
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<bool> sendMessage(
      {required String name,
      required String noHp,
      required String email,
      required String pesan});
  Future<bool> addKapanewon({
    required String areaName,
    required String kodeArea,
  });
  Future<bool> deleteMessage(int id);
  Future<bool> deleteKapanewon(int id);
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

  @override
  Future<List<MessageModel>> getMessages() async {
    var response = await http.get(
      Uri.parse(baseUrl + 'message'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List data = json['data'];
      return data.map((e) => MessageModel.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<bool> sendMessage(
      {required String name,
      required String noHp,
      required String email,
      required String pesan}) async {
    var response = await http.post(
      Uri.parse(baseUrl + 'message'),
      headers: headers,
      body: jsonEncode(<String, String>{
        'Fullname': name,
        'Phone': noHp,
        'Email': email,
        'Message': pesan,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception();
    }
  }

  @override
  Future<bool> deleteMessage(int id) async {
    var response = await http.delete(
      Uri.parse(baseUrl + 'message/$id'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    var response = await http.get(
      Uri.parse(baseUrl + "users"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List data = json['data'];
      return data.map((e) => UserModel.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<bool> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    var response = await http.post(
      Uri.parse(baseUrl + 'register'),
      headers: headers,
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
        'confirm-password': confirmPassword,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<KapanewonModel>> getKapanewon() async {
    var response = await http.get(
      Uri.parse(baseUrl + 'kapanewon'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List data = json['data'];
      return data.map((e) => KapanewonModel.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<bool> addKapanewon(
      {required String areaName, required String kodeArea}) async {
    var response = await http.post(
      Uri.parse(baseUrl + 'kapanewon'),
      headers: headers,
      body: jsonEncode(<String, String>{
        'area_name': areaName,
        'kode_area': kodeArea,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception();
    }
  }

  @override
  Future<bool> deleteKapanewon(int id) async {
    var response = await http.delete(
      Uri.parse(baseUrl + 'kapanewon/$id'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception();
    }
  }
}
