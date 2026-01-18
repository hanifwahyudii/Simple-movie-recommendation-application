import 'package:amflix/routes/app_routes.dart';
import 'package:flutter/material.dart';



class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 35, right: 20),
            child: Image.asset("assets/images/logo_splash.png",
            height:352 ,
            width: 320,),
          ),
       
          Text("Yuk, Membaca Bersama",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold
          )
          ),
          
          Text("PM News",
          style:TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold
          )
          ),
          SizedBox(height: 25,),
          Text("Berita Terpercaya, Di ujung Jari Anda",
          style: TextStyle(
            fontSize: 15
          )
          ),
          
          SizedBox(height: 39,),
          SizedBox(
            height:52 ,
            width: 340,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3498DB),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              onPressed: (){
                Navigator.pushNamed(context,AppRoutes.login);
              },
           
             child: Text("Masuk",
             style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
             ),
             )),
          ),

          SizedBox(height: 20,),
           SizedBox(
            height:52 ,
            width: 340,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(               
                foregroundColor: Color(0xff3498DB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                side: BorderSide(
                  color: Color(0xff3498DB)
                )
              ),
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.register);
              },    
             child: Text("Mendaftar",
             style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
             ),)),
          ),
          
        ],
      ),
    );
  }
}