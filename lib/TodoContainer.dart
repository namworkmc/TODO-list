import 'package:flutter/material.dart';

class TodoContainer extends StatefulWidget {
  const TodoContainer({Key? key}) : super(key: key);

  @override
  _TodoContainerState createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  final Map<String, bool> _checkedMap = {
    "YQ75Izp": false,
    "tMnw": false,
    "0o6Hoooh": false,
    "pdov8r22": false,
    "6EPCT5": false,
    "s7DyEs2": false,
    "g7WE3Yl0": false,
    "Gd7": false,
    "a1rr": false,
    "t33V8opW": false,
    "1Z8g": false,
    "4MN7ga0": false,
    "8n7crb": false,
    "M8d1ya": false,
    "1pr6nHC1": false,
    "8NF": false,
    "xLqtsDHu": false,
    "F1K": false,
    "Tb57keBk": false,
    "Ilh1PXNA": false,
    "5sF": false,
    "DxAZ4076": false,
    "i8z": false,
    "1Sjv": false,
    "Ax4O8": false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 200,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 150,
                  width: MediaQuery.of(context).size.width,
                  alignment: AlignmentDirectional.center,
                  child: checkBoxList(),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add_circle, color: Colors.white, size: 30,),
      ),
    );
  }

  Widget checkBoxList() {
    return ListView(
        children: _checkedMap.keys.map((String key) {
      return CheckboxListTile(
        title: Text(key,
            style: const TextStyle(
                fontSize: 18,
                fontFamily: "IBMPlexSans",
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center),
        controlAffinity: ListTileControlAffinity.leading,
        checkColor: Colors.white,
        activeColor: Colors.blueAccent,
        onChanged: (bool? value) {
          setState(() {
            _checkedMap[key] = value!;
          });
        },
        value: _checkedMap[key],
      );
    }).toList());
  }
}
