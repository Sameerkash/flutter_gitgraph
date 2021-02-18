import 'package:flutter/material.dart';

class CurveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 400,
        child:CustomPaint(
          painter: CurveCustomPainter(),
        )
    );
  }
}

class CurveCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.5500000,size.height*0.3750000);
    path_0.quadraticBezierTo(size.width*0.6650000,size.height*0.3750000,size.width*0.7300000,size.height*0.3750000);
    path_0.quadraticBezierTo(size.width*0.7298000,size.height*0.3885250,size.width*0.7300000,size.height*0.4000000);
    path_0.cubicTo(size.width*0.7288000,size.height*0.4056500,size.width*0.7332000,size.height*0.4136750,size.width*0.7100000,size.height*0.4250000);
    path_0.quadraticBezierTo(size.width*0.6855000,size.height*0.4353250,size.width*0.6100000,size.height*0.4500000);
    path_0.lineTo(size.width*0.5000000,size.height*0.4750000);
    path_0.quadraticBezierTo(size.width*0.4074000,size.height*0.4958750,size.width*0.4000000,size.height*0.5000000);
    path_0.cubicTo(size.width*0.3579000,size.height*0.5127500,size.width*0.3512000,size.height*0.5182500,size.width*0.3500000,size.height*0.5250000);
    path_0.quadraticBezierTo(size.width*0.3491000,size.height*0.5455000,size.width*0.3500000,size.height*0.5500000);
    path_0.lineTo(size.width*0.3000000,size.height*0.5500000);
    path_0.lineTo(size.width*0.1600000,size.height*0.5500000);
    path_0.lineTo(size.width*0.1600000,size.height*0.5250000);
    path_0.quadraticBezierTo(size.width*0.1652000,size.height*0.5086750,size.width*0.1900000,size.height*0.5000000);
    path_0.quadraticBezierTo(size.width*0.2426000,size.height*0.4851250,size.width*0.3000000,size.height*0.4725000);
    path_0.quadraticBezierTo(size.width*0.3750000,size.height*0.4562500,size.width*0.4000000,size.height*0.4500000);
    path_0.cubicTo(size.width*0.4250000,size.height*0.4437500,size.width*0.4705000,size.height*0.4345500,size.width*0.5100000,size.height*0.4250000);
    path_0.cubicTo(size.width*0.5147000,size.height*0.4205250,size.width*0.5501000,size.height*0.4185500,size.width*0.5500000,size.height*0.4000000);
    path_0.cubicTo(size.width*0.5490000,size.height*0.3931000,size.width*0.5547000,size.height*0.3863750,size.width*0.5500000,size.height*0.3750000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
