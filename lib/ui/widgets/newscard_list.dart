import 'package:finance_app/core/model/news_data.dart';
import 'package:finance_app/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCardList extends StatelessWidget {
  final List<NewsData> data;

  const NewsCardList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (c, i) => InkWell(
        onTap: () {
          contactLaunch(
            Uri.parse(data[i].url ?? ''),
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Row(children: [
            Image.network(
              data[i].image ?? '',
              width: 100.w,
              height: 100.h,
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: SizedBox(
                width: 266.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[i].source ?? ''.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Rubik",
                            color: Colors.white.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          formatDate(data[i].datetime ?? 0),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Rubik",
                            color: Colors.white.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      data[i].headline ?? '',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                        color: Colors.white,
                        height: 1.2.h,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
      separatorBuilder: (c, i) => const SizedBox(),
      itemCount: data.length,
    );
  }

  String formatDate(int date) {
    return DateFormatter.dateFormat2
        .format(DateTime.fromMillisecondsSinceEpoch((date * 1000)));
  }

  void contactLaunch(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {}
  }
}
