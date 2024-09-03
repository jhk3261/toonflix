import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

//getTodaysToons은 어느 argument를 요구하지 않음 -> stateless 사용
//getToonById는 id라는 argument 요구 -> state 사용 (initState사용을 위함 -> id를 받아와야하기 때문에)
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
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(future),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> future) {
    return ListView.separated(
      //ListView.builder -> 사용자가 보고 있는 아이템만 표시
      //ListView.seperated -> 아이템 사이에 widget 렌더링

      // children: const [
      //   // for (var webtoon in future.data!) Text(webtoon.title), //효율적이지 않음
      // ],

      scrollDirection: Axis.horizontal,
      itemCount: future.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        //listview의 item을 만드는 역할
        // print(index);
        var webtoon = future.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      //아이템 사이의 구분자를 넣어줌
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
