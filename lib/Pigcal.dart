import 'package:flutter/material.dart';

class Pigcal extends StatefulWidget {
  const Pigcal({Key? key}) : super(key: key);

  @override
  _PigcalState createState() => _PigcalState();

}

class _PigcalState extends State<Pigcal> {
  var _lengthController = TextEditingController();
  var _girthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 75.0),
            const Text("PIG WEIGHT", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.pinkAccent)),
            const Text("CALCULATOR", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.pinkAccent)),
            SizedBox(height: 25.0),
            Image.asset('assets/images/pig.png', height: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('LENGTH', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                            const Text('(cm)', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _lengthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Input length',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20.0)
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('GIRTH', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                            const Text('(cm)', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _girthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Input girth',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20.0)
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(


                          onPressed: (
                            ){
                          var lengthText = _lengthController.text;
                          var girthText = _girthController.text;
                          double? length = double.tryParse(lengthText);
                          double? girth = double.tryParse(girthText);
                          if(length == null || girth == null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("ERROR"),
                                  content: const Text("Invalid input"),
                                  actions: [
                                    // ปุ่ม OK ใน dialog
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        // ปิด dialog
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          else {
                            double weight = (girth/100) * (girth/100) * (length/100) * 69.3;
                            double price = 112.50 * weight;
                            double minWeight = 0.97 * weight;
                            double maxWeight = 1.03 * weight;
                            double minPrice = 0.97*price;
                            double maxPrice = 1.03*price;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(

                                  title: Row(
                                    children: [
                                      Image.asset("assets/images/ic_pig.png",height: 30.0),
                                      Text((' RESULT')),

                                    ],
                                  ),
                                  content: Text('Weight: ${minWeight.round()} - ${maxWeight.round()} kg\nPrice: ${minPrice.round()} - ${maxPrice.round()} Baht'),
                                  actions: [
                                    // ปุ่ม OK ใน dialog
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        // ปิด dialog
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text('CALCULATE', style: TextStyle(fontSize: 20.0)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(50.0, 50.0),
                            primary: Colors.pink, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        ),
                       ],
                  ),
                ],
               ),
            ),
          ],
        ),
      ),
    );
  }
}