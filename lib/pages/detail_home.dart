import 'package:amflix/widgets/movie_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/movie_model.dart';



class DetailMovie extends StatelessWidget {
  final Movie movie;

  const DetailMovie({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(movie.title,
        style: GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )
        ),
        centerTitle: true,
        actions: [Image.asset("assets/images/launch_icon.png",)
        ]       
      ),
      body: MovieDetailWidget(movie: movie)
    );
  }
}
