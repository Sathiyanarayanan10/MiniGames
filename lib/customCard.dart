import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget{

  final String imgPath;
  final String titleText;
  final VoidCallback? onPressed;
  final Widget gameScreen;
  CustomCard({
    required this.imgPath,
    required this.titleText,
    this.onPressed,
    required this.gameScreen
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
            child: Transform.scale(
              scale: 1,
              child: Image.asset(imgPath,
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(titleText, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              RoundIconButton(
                icon: Icons.play_arrow,
                onPressed: (){
                  // open respective game
                  Navigator.push(context, MaterialPageRoute(builder: (context) => gameScreen));
                },
              )
            ],
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget{
  final IconData icon;
  final VoidCallback onPressed;
  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.green,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }

}