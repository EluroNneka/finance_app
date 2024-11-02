import 'package:get/get.dart';
import 'dart:convert';
import 'package:finance_app/core/constants/app_keys.dart';
import 'package:finance_app/core/model/news_data.dart';
import 'package:finance_app/core/model/user_data.dart';
import 'package:finance_app/core/services/database_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DashboardController extends GetxController{
  List<NewsData> news = [];
  bool loading = false;

  UserData? _userData;
  UserDatabaseManager _userDatabaseManager = UserDatabaseManager();

  String newsApi = "${AppKeys.baseUrl}?category=general&token=${AppKeys.token}";

  //getter for news
  List<NewsData> get getNews {
    return news;
  }

  Future<String?> getUserData() async {
    if (_userData == null) {
      _userData = await _userDatabaseManager.getFirstUser();
      return _userData?.firstName..toString();
    } else {
      print(_userData?.lastName..toString());
      return _userData?.firstName.toString();
    }
  }

  void setNews(List<NewsData> val) {
    news = val;
    update();
  }

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }





  Future<List<NewsData>> fetch(http.Client https) async {
    //Making Api call
    loading = true;
    final response = await https.get(Uri.parse(newsApi));

    debugPrint("The response: ${response.body}");

    if (response.statusCode == 200) {
      loading = false;
      List<NewsData> temp = [];
      jsonDecode(response.body).forEach((e) => temp.add(NewsData.fromJson(e)));
      setNews(temp);
      return temp;
    } else {
      throw Exception('Failed to load');
    }
  }

  void fetchNews() async {
    await fetch(http.Client());
    update();
  }
}

