import 'package:amflix/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Registrasion extends StatefulWidget {
  const Registrasion({super.key});

  @override
  State<Registrasion> createState() => _RegistrasionState();
}

class _RegistrasionState extends State<Registrasion> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();
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
              style: const TextStyle(color: Colors.white),
              controller: emailC,
              decoration: InputDecoration(
                hintText: "Email",
                
              border: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(height: 25,),
          SizedBox(
            height: 52,
            width: 350,
            child: TextField(
              style: const TextStyle(color: Colors.white),
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
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              controller: confirmPassC,
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
              if (emailC.text.isEmpty || passC.text.isEmpty || confirmPassC.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Semua field wajib diisi")));
                  return;
                }

                if (passC.text.length < 6) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Password minimal 6 karakter")));
                  return;
                }

                if (passC.text.trim() != confirmPassC.text.trim()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Password tidak sama")));
                  return;
                }

              try {
                final result = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: emailC.text.trim(),
                      password: passC.text.trim(),
                    );

                if (result.user != null) {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                }

              } on FirebaseAuthException catch (e) {
                String msg = "Registration failed. Please try again.";

                if (e.code == 'email-already-in-use') {
                  msg = "Email sudah terdaftar.";
                } else if (e.code == 'weak-password') {
                  msg = "Password terlalu lemah (min 6 karakter).";
                } else if (e.code == 'invalid-email') {
                  msg = "Format email tidak valid.";
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
                Text("Sudah punya akun? silahkan ",
                style: TextStyle(
                  fontSize: 15,  
                  color: Colors.white       
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
                 child: Text("Masuk",
                 style: GoogleFonts.roboto(
                  color: Color(0xff3498DB),
                  fontWeight: FontWeight.bold
                  )
                ),
              )           
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