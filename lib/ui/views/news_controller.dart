import 'dart:convert';
import 'package:finance_app/core/constants/app_keys.dart';
import 'package:finance_app/core/model/news_data.dart';
import 'package:finance_app/core/model/user_data.dart';
import 'package:finance_app/core/services/database_service.dart';
import 'package:finance_app/ui/views/notification_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NewsController extends GetxController {
  //List of news headline
  List<NewsData> news = [];
  String? firstName;
  String? lastName;
  String? userName;

  String newsApi = "${AppKeys.baseUrl}?category=general&token=${AppKeys.token}";

  //getter for news
  List<NewsData> get getNews {
    return news;
  }

  //getter for first name
  String? get getFName {
    return firstName;
  }

  //getter for last name
  String? get getLName {
    return lastName;
  }

  void setFirstName(String val) {
    firstName = val;
    update();
  }

  void setLastName(String val) {
    lastName = val;
    update();
  }

  void setUserName(String val) {
    userName = val;
    update();
  }

  void setNews(List<NewsData> val) {
    news = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future registerUser(
    BuildContext context,
  ) async {
    try {
      // Initialising database instance
      UserDatabaseManager user = UserDatabaseManager();
      await user.initializeDatabase();

      // Inserting the user details
      var userData = UserData(firstName, lastName);
      await user.insertData(userData);

      // After successful registration user will be navigated to notification page
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => (const NotificationView())));
    } catch (err) {
      //notify user of any error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    update();
  }

  /* Future fetchUser() async {
    UserDatabaseManager user = UserDatabaseManager();
   var result = await user.getUser(1);
    setUserName(UserData.fromMap(result!.toMap()).firstName!);

    update();
  }*/

  Future<List<NewsData>> fetch(http.Client https) async {
    //Making Api call
    final response = await https.get(Uri.parse(newsApi));

    debugPrint("The response: ${jsonDecode(response.body)}");

    if (response.statusCode == 200) {
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
