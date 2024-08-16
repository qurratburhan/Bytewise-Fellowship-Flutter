import 'package:flutter/material.dart';
import 'package:movie_appp/Models/Tv_series_Models.dart';
import 'package:movie_appp/Models/upcoming_Models.dart';
import 'package:movie_appp/Widget/custom_carousel.dart';
import 'package:movie_appp/Widget/movie_card_widget.dart';
import 'package:movie_appp/screens/searchscreen.dart';
import 'package:movie_appp/services/api_services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  late Future<Upcomingmoviemodel> upcomingFuture;
  late Future<Upcomingmoviemodel> now_playingFuture;
  late Future<TvSeriesModel>TopRatedSeries;

  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovies();
    now_playingFuture=apiServices.getNowPlayingMovies();
    TopRatedSeries = apiServices.getTopRatedSeries();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
          width: 120,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              onTap: () {},
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: TopRatedSeries,
              builder: (context,snapshot) {
                if(snapshot.hasData) {
                return CustomCarouselSlider(data: snapshot.data!);
              } 
              else {
                 return const SizedBox.shrink();
              }
              }
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                future: now_playingFuture,
                headlineText: 'Now Playing',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                future: upcomingFuture,
                headlineText: 'Upcoming Movies',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
