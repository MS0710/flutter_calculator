import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget{
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }

}

class _Calculator extends State<Calculator>{

  ValueNotifier<String> set1 = ValueNotifier("0");
  double firstValue = 0;
  double secondValue = 0;
  int flag = 0;
  String calculate = "";
  Color numColor = const Color(0xFF363636);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int temp = 0;
    String temp2 = "";
    double widthValue = 75.0;
    double width_0_Value = 158.0;

    List<Map> list3 = [
      {"text" : "C", "color" : numColor,'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "+/-", "color" : numColor,'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "%", "color" : numColor,'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "÷", "color" : const Color(0xFFE89E28),'highlightColor': const Color(0xFFEDC68F), "width" : widthValue,},
      ////
      {"text" : "7", "color" : numColor,'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "8", "color" : numColor,'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "9", "color" : numColor,'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "x", "color" : const Color(0xFFE89E28),'highlightColor': const Color(0xFFEDC68F), "width" : widthValue,},
      ////
      {"text" : "4", "color" : const Color(0xFF363636),'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "5", "color" : const Color(0xFF363636),'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "6", "color" : const Color(0xFF363636),'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "－", "color" : const Color(0xFFE89E28),'highlightColor': const Color(0xFFEDC68F), "width" : widthValue,},
      ////
      {"text" : "1", "color" : const Color(0xFF363636),'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "2", "color" : const Color(0xFF363636),'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "3", "color" : const Color(0xFF363636),'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "+", "color" : const Color(0xFFE89E28),'highlightColor': const Color(0xFFEDC68F), "width" : widthValue,},
      ////
      {"text" : "0", "color" : const Color(0xFF363636), 'highlightColor': const Color(0xFF363636), "width" : width_0_Value,},
      {"text" : ".", "color" : const Color(0xFF363636),'highlightColor': const Color(0xFF363636), "width" : widthValue,},
      {"text" : "=", "color" : const Color(0xFFE89E28),'highlightColor': const Color(0xFFEDC68F), "width" : widthValue,},
    ];

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[

            Expanded(
              child: Container(
                color: Colors.black,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 10),
                child: ValueListenableBuilder<String>(
                  valueListenable: set1,
                  builder: set1Builder,
                ),
              ),
            ),


            SizedBox(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Material(
                    color: Colors.black,
                    child: Wrap(
                      spacing: 15.0, // 主轴(水平)方向间距
                      runSpacing: 8.0, // 纵轴（垂直）方向间距
                      alignment: WrapAlignment.center, //沿主轴方向居中
                      children: List.generate(list3.length, (index) {
                        return Ink(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(200)),
                            color: list3[index]["color"],
                          ),
                          child: InkWell(
                            onTap: (){
                              switch(list3[index]["text"]){
                                case "C":
                                  resetAll();
                                  break;
                                case "0":
                                case "1":
                                case "2":
                                case "3":
                                case "4":
                                case "5":
                                case "6":
                                case "7":
                                case "8":
                                case "9":
                                  print("flag == $flag");
                                  if(flag == 1){
                                    set1.value = "0";
                                    flag = 2;
                                  }
                                  if(flag >2){
                                    resetAll();
                                  }
                                  if(set1.value == "0"){
                                    set1.value = list3[index]["text"];
                                  }else{
                                    set1.value += list3[index]["text"];
                                  }
                                  break;
                                case ".":
                                  if(flag >2){
                                    resetAll();
                                  }
                                  if(!set1.value.contains(".")){
                                    set1.value += list3[index]["text"];
                                  }
                                  break;
                                case "+/-":
                                  double tempValue = 0;
                                  tempValue = double.parse(set1.value) * -1;
                                  set1.value = tempValue.toString();
                                  break;
                                case "%":
                                  double tempValue = 0;
                                  tempValue = double.parse(set1.value);
                                  set1.value = tempValue.toString();
                                  break;
                                case "－":
                                  print("-");
                                  calculate = "－";
                                  flag = 1;
                                  firstValue = double.parse(set1.value);
                                  print("flag == $flag");
                                  break;
                                case "+":
                                  print("+");
                                  calculate = "+";
                                  flag = 1;
                                  firstValue = double.parse(set1.value);
                                  print("flag == $flag");
                                  break;
                                case "x":
                                  print("x");
                                  calculate = "x";
                                  flag = 1;
                                  firstValue = double.parse(set1.value);
                                  print("flag == $flag");
                                  break;
                                case "÷":
                                  print("÷");
                                  calculate = "÷";
                                  flag = 1;
                                  firstValue = double.parse(set1.value);
                                  print("flag == $flag");
                                  break;
                                case "=":
                                  print("=");
                                  if(flag == 2){
                                    secondValue = double.parse(set1.value);
                                  }
                                  if(flag >= 2){
                                    switch(calculate){
                                      case "+":
                                        set1.value = (firstValue + secondValue).toString();
                                        break;
                                      case "－":
                                        set1.value = (firstValue - secondValue).toString();
                                        break;
                                      case "x":
                                        set1.value = (firstValue * secondValue).toString();
                                        break;
                                      case "÷":
                                        set1.value = (firstValue / secondValue).toString();
                                        break;
                                    }
                                    firstValue = double.parse(set1.value);
                                    flag++;
                                  }
                                  break;
                              }
                            },
                            borderRadius: const BorderRadius.all(Radius.circular(200)),
                            //highlightColor: const Color(0xFF363636),
                            highlightColor: list3[index]["highlightColor"],
                            child: Container(
                              width: list3[index]["width"],
                              height: 75.0,
                              alignment: Alignment.center,
                              child: Text(
                                list3[index]["text"],
                                style: const TextStyle(color: Colors.white,fontSize: 40,),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
            ),

            SizedBox(
              height: 20,
              child: Container(
                color: Colors.black,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget set1Builder(BuildContext context ,String value,Widget? child){
    var wid = Text(value,style: const TextStyle(fontSize: 48,color: Colors.white),);
    return wid;
  }
  
  bool checkWord(String msg){
    if(msg == "0"){
      return true;
    }else if(msg == "1"){
      return true;
    }else if(msg == "2"){
      return true;
    }
    return false;
  }

  void resetAll(){
    set1.value = "0";
    firstValue = 0;
    secondValue = 0;
    flag = 0;
  }
}




