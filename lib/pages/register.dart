import 'package:amflix/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registrasion extends StatefulWidget {
  const Registrasion({super.key});

  @override
  State<Registrasion> createState() => _RegistrasionState();
}

class _RegistrasionState extends State<Registrasion> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left:26 , right:24 ),
            child: Image.asset("assets/images/logo_splash.png",
            height:330 ,
            width: 352,),
          ),

          SizedBox(height: 25),
          SizedBox(
            height: 52,
            width: 350,
            child: TextField(
              controller: emailC,
              decoration: InputDecoration(
                hintText: "Email",
                
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(height: 25,),
          SizedBox(
            height: 52,
            width: 350,
            child: TextField(
              obscureText: true,
              controller: passC,
              decoration: InputDecoration(
                hintText: "Password",
                
                 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),

          SizedBox(height: 25,),
          SizedBox(
            height: 52,
            width: 350,
            child: TextField(
              obscureText: true,
              controller: passC,
              decoration: InputDecoration(
                hintText: "Konfirmasi Password",
                
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),

          SizedBox(height: 25,),
          SizedBox(
            height: 52,
            width: 354,
            child: ElevatedButton(
             style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff3498DB),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
             ),
             onPressed: () async {
              try {
              final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailC.text.trim(),
                  password: passC.text.trim(),
              );
              if (result.user != null) {
                Navigator.of(context).pushReplacementNamed(AppRoutes.login);
              }
             }
             on FirebaseAuthException catch (e) {
                String msg = "Email  or Password wrong";

                if (e.code == 'user-not-found') {
                  msg = "Email tidak terdaftar";
                } else if (e.code == 'wrong-password') {
                  msg = "Password salah";
                } else if (e.code == 'invalid-email') {
                  msg = "Format email tidak valid";
                }

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(msg)));
              }
             },
             child: Text("Mendaftar",
             style: TextStyle(
              fontSize: 15,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold
              ),
             )
            ),
          ),

          SizedBox(height: 30,),
          SizedBox(
            height: 52,
            width: 354,
            child: OutlinedButton(
             style: OutlinedButton.styleFrom(
              foregroundColor: Color(0xffE74C3C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
                ),
                side: BorderSide(
                  color: Color(0xffE74C3C)
                )
             ),
             onPressed: (){},
             child: Text("Google",
             style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
              ),
             )
            ),
          ),

          SizedBox(height:39 ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun? silahkan",
                style: TextStyle(
                  fontSize: 15,         
                ),
              ),
                TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.login);
                },
                 child: Text("Masuk"))
            
              ],
            ),
          )
        ],
      ),
    );
  }
}

extension on Future<UserCredential> {
  
}