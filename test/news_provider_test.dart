import 'package:finance_app/core/model/news_data.dart';
import 'package:finance_app/ui/views/dashboard/dashboard_controller.dart';
import 'package:finance_app/ui/views/login/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_provider_test.mocks.dart';

@GenerateMocks([http.Client])

final news = DashboardController();

void main(){

  group('validate api response details',(){
    test('test Api success response', () async{
      //Arrange
      final mockClient = MockClient();
      when(mockClient.get(Uri.parse(news.newsApi))).thenAnswer((real) async =>
      http.Response(
          ' [{ "category": "technology","datetime": 1596589501,"headline": "Square surges after reporting 64% jump in revenue, more customers using Cash App","image": "https://image.cnbcfm.com/api/v1/image/105569283-1542050972462rts25mct.jpg?v=1542051069","source": "CNBC","url": "https://www.cnbc.com/2020/08/04/square-sq-earnings-q2-2020.html"}]',
           200));

      //Act and Assert

      expect(await news.fetch(mockClient), isA<List<NewsData>>());

    });

    test('Api failed response should finish with an error ', () async{
      //Arrange
      final mockClient = MockClient();
      when(mockClient.get(Uri.parse(news.newsApi))).thenAnswer((real) async =>
          http.Response(
             'Failed to load',
              404));

      //Act and Assert

      expect(await news.fetch(mockClient), throwsException);

    });




  } );

}