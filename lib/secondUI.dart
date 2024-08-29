import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

//UI구축
class _AppState extends State<App> {
  // List<int> numbers = [];
  // int counter = 0;
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    setState(() {
      //데이터변경 알리는 함수 (없다면 build함수 실행 안 됨)
      //데이터 변경을 무조건 여기 넣어야하나? 답은 노. (넣으면 가독성은 좋다.)
      // numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFF4EDDB),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showTitle ? const MyLargeTitle() : const Text('nothing'),
                IconButton(
                    onPressed: toggleTitle,
                    icon: const Icon(Icons.remove_red_eye))
                // for (var n in numbers) Text('$n'),
                // Text(
                //   '$counter',
                //   style: const TextStyle(
                //     fontSize: 20,
                //   ),
                // ),
                // IconButton(
                //     onPressed: onClicked, icon: const Icon(Icons.add_box_rounded))
              ],
            ),
          ),
        ));
  }
}

//appstate에서 위젯 분리
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    //상태초기화메소드 -> 부모요소에 의존하는 데이터 초기화 시 사용
    //항상 build보다 먼저 호출 (단 한 번만 호출됨)
    super.initState();
  }

  @override
  void dispose() {
    //api업데이트, 이벤트 리스너로부터 구독 취소나 form의 리스너에서 벗어날 때,
    //무언가를 취소하는 곳.
    super.dispose();
  }

  //context : 상위요소의 모든 정보 (부모요소에 대한 모든 정보)
  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.titleLarge!.color,
        //!(느낌표) or ?(물음표)
      ),
    );
  }
}
