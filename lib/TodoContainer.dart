import 'package:flutter/material.dart';
import 'package:todo_list/CheckMap.dart';

class TodoContainer extends StatefulWidget {
  const TodoContainer({Key? key}) : super(key: key);

  @override
  _TodoContainerState createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  var checkList = [
    CheckMap(job: "YQ75Izp", isCheck: false),
    CheckMap(job: "tMnw", isCheck: false),
    CheckMap(job: "0o6Hoooh", isCheck: false),
    CheckMap(job: "pdov8r22", isCheck: false),
    CheckMap(job: "6EPCT5", isCheck: false),
    CheckMap(job: "s7DyEs2", isCheck: false),
    CheckMap(job: "g7WE3Yl0", isCheck: false),
    CheckMap(job: "Gd7", isCheck: false),
    CheckMap(job: "a1rr", isCheck: false),
    CheckMap(job: "t33V8opW", isCheck: false),
    CheckMap(job: "1Z8g", isCheck: false),
    CheckMap(job: "4MN7ga0", isCheck: false),
    CheckMap(job: "8n7crb", isCheck: false),
    CheckMap(job: "M8d1ya", isCheck: false),
    CheckMap(job: "1pr6nHC1", isCheck: false),
    CheckMap(job: "8NF", isCheck: false),
    CheckMap(job: "xLqtsDHu", isCheck: false),
    CheckMap(job: "F1K", isCheck: false),
    CheckMap(job: "Tb57keBk", isCheck: false),
    CheckMap(job: "Ilh1PXNA", isCheck: false),
    CheckMap(job: "5sF", isCheck: false),
    CheckMap(job: "DxAZ4076", isCheck: false),
    CheckMap(job: "i8z", isCheck: false),
    CheckMap(job: "1Sjv", isCheck: false),
    CheckMap(job: "Ax4O8", isCheck: false),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    final CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _animation = Tween(begin: 1.6, end: 1.0).animate(curvedAnimation)
      ..addListener(() => setState(() {}));

    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              )),
          Expanded(
              flex: 7,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width,
                child: _checkBoxList(),
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(child: Text("hehe")),
            ListTile(title: Text("hehe")),
            ListTile(title: Text("hehe")),
            ListTile(title: Text("hehe")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listKey.currentState
              ?.insertItem(0, duration: const Duration(milliseconds: 850));
          checkList = [CheckMap(job: "hehe", isCheck: false), ...checkList];

          _controller.forward(from: 0.0);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _checkBoxList() {
    return AnimatedList(
      padding: const EdgeInsets.only(top: 15),
      key: listKey,
      initialItemCount: checkList.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: Tween<Offset>(
                  begin: const Offset(0.8, 0), end: const Offset(0, 0))
              .animate(
                  CurvedAnimation(parent: animation, curve: Curves.elasticOut)),
          child: _buildRowCheckTile(checkList[index]),
        );
      },
    );
  }

  Widget _buildRowCheckTile(CheckMap checkMap) {
    return CheckboxListTile(
      title: Container(
        transform: Matrix4.identity()..scale(_animation.value, 1.0),
        child: Text(
          checkMap.job,
          style: TextStyle(
              fontSize: 20,
              fontFamily: "IBMPlexSans",
              fontWeight: FontWeight.w300,
              decorationColor: Colors.blueAccent,
              decorationStyle: TextDecorationStyle.solid,
              decoration: checkMap.isCheck
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.white,
      activeColor: Colors.blueAccent,
      onChanged: (bool? value) {
        setState(() {
          checkMap.isCheck = value!;
        });
      },
      value: checkMap.isCheck,
    );
  }

  Widget _buildRowTextField() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter a search term',
      ),
    );
  }
}
