// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movies_app/Api/api_manger.dart';
// ignore: unused_import
import 'package:movies_app/Model/smiler_model.dart';

import 'UpComingsection/upcoming_details.dart';
import 'popularsec/Popular_item.dart';
import 'topRatedSec/toprated_widget.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      List<Map<String, dynamic>>? fetchedMovies =
          await ApiManager.getMovies(page: 1);
      setState(() {
        movies = fetchedMovies!;
      });
    } catch (error) {
      // Handle error
      // ignore: avoid_print
      print('Error fetching movies: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopularItems(movies: movies),
          const SizedBox(height: 20),
          UpComing_details(),
          const SizedBox(height: 20),
          const TopRatedWidget(),
        ],
      ),
    );
  }
}
