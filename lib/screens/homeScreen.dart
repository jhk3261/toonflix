import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, future) {
          //snapshot은 future의 상태를 알 수 있다
          if (future.hasData) {
            //많은양의 데이터를 보여주고 싶을 때 ListView 사용
            return ListView.separated(
              //ListView.builder -> 사용자가 보고 있는 아이템만 표시
              //ListView.seperated -> 아이템 사이에 widget 렌더링

              // children: const [
              //   // for (var webtoon in future.data!) Text(webtoon.title), //효율적이지 않음
              // ],

              scrollDirection: Axis.horizontal,
              itemCount: future.data!.length,
              itemBuilder: (context, index) {
                // print(index);
                var webtoon = future.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
