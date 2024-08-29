import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    //Future 타입? = 미래에 받을 값을 알려줌 , 완료되었을 때 Response에 반환값이 저장
    //비동기 프로그래밍(await) : api 요청 후 서버가 응답할 때까지 기다리기
    //async 함수 안에서만 await 사용가능 (보통 Future 타입과 자주 쓰임)

    if (response.statusCode == 200) {
      //200은 요청 성공의 뜻
      print(response.body);
      return;
    }
    throw Error();
  }
}
