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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Your BMI"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 11,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kgs'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your height in feet'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your height in inches'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),

                ElevatedButton(onPressed:(){

                  var wt=wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){

                    var intWeight=int.parse(wt);
                    var intFeet = int.parse(ft);
                    var intInch = int.parse(inch);

                    var totalInch = (intFeet*12) + intInch;
                    var totalCm = totalInch*2.54;
                    var totalMeter = totalCm/100;

                    var bmi = intWeight/(totalMeter*totalMeter);
                    var msg="";

                    if(bmi>25){
                      msg = "You are Overweight!";
                      bgColor = Colors.orange.shade300;
                    }else if(bmi<18){
                      msg="You are Underweight!!";
                      bgColor = Colors.red.shade300;
                    }else{
                      msg = "You are Healthy!!";
                      bgColor= Colors.green.shade300;
                    }

                    setState(() {
                      result = "$msg \n \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                    });

                  }else{
                    setState(() {
                      result="Please fill all the required fields!!";
                    });
                  }

                }, child: Text('Calculate')),
                SizedBox(height: 19,),
                Text(result,style: TextStyle(
                  fontSize: 19
                ),)

              ],
            ),
          ),
        ),
      )
    );
  }
}
