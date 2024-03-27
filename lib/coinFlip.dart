import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlipCoin extends StatefulWidget{
  const FlipCoin({super.key});

  @override
  State<FlipCoin> createState() => _FlipCoin();
}

class _FlipCoin extends State<FlipCoin>{

  Random random = Random();
  int currentImageIndex = 0;
  int counter = 1;
  int headcnt=0;
  int tailcnt=0;
  List<String> images = [
    'assets/head.png',
    'assets/tail.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Toss a Coin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                images[currentImageIndex],
                height: 400,
                width: 400,
              ),
              const SizedBox(height: 60,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),//style
                  onPressed: () async{
                    Timer.periodic(const Duration(milliseconds: 100), (timer) {
                      counter++;
                      setState(() {
                        currentImageIndex=random.nextInt(2);
                      });
                      if(counter>=13){
                        timer.cancel();
                        setState(() {
                          counter=1;
                          if(currentImageIndex==0){
                            headcnt++;
                          }else{
                            tailcnt++;
                          }
                        });
                      }
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                      child: Text(
                        'T O S S',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                  )
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                    color: Colors.green,
                    width: 8.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Heads : $headcnt',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text('Tails : $tailcnt',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),)
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }

}