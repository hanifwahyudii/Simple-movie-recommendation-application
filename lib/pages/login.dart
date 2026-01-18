import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:amflix/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:22 ,top:40 ,right:19 ),
            child: Image.asset("assets/images/logo_splash.png",
            height:330 ,
            width: 352,),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 59,
            width: 354,
            child: TextField(
              controller: emailC,
              obscureText: false,
              decoration: InputDecoration(               
                hintText: "Email", hintStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            )
           ),
          SizedBox(height: 16,),
           SizedBox(
            height: 59,
            width: 354,
            child: TextField(
              controller: passC,
              obscureText: true,
              decoration: InputDecoration(               
                hintText: "Password", hintStyle: GoogleFonts.montserrat(
                  fontSize: 15,             
                ),                     
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                
                
              ),
            )
           ),
          SizedBox(height: 49,),
           SizedBox(
            height: 59,
            width: 354,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff3498DB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
             onPressed: () async {
              try {
                final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailC.text.trim(),
                      password: passC.text.trim(),
                    );
                    

                if (result.user != null) {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                }
              } on FirebaseAuthException catch (e) {
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
                            
             child: Text("Masuk",
             style: GoogleFonts.poppins(
              fontSize: 15,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold
             ),)),
          ),
          SizedBox(height: 40,),
           SizedBox(
            height: 59,
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
             style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.bold
             ),
             )
             ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Belum punya akun?",
              style: GoogleFonts.roboto(
                fontSize: 15,               
              ),
              ),
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.register);
                
              },
               style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
               child: Text(" Mendaftar",
               style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff3498DB)
               ),
               )
               ),
              Text(" sekarang",
              style: GoogleFonts.roboto(
                fontSize: 15,               
                ),
                )
            ],
          )
        ],
      ),
    );
  }
}
