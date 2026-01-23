
import 'package:amflix/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black ,
      body: Column(
        children: [
          
             Padding(
              padding: const EdgeInsets.only(top: 326, left: 109, right: 109),
              child: Image.asset("assets/images/title.png"),
            ),

            SizedBox(height: 20,),

            SizedBox(
              height:62 ,
              width: 322,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0xff1D546D) 
                 ),
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                }, child: 
              
              Text("Mulai",
              style: GoogleFonts.roboto(
                color: Color(0xffF2EDED),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),)),
            )
        ],
      ),
    );
  }
}