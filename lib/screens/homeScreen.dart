import 'package:flutter/material.dart';
import 'package:movies_app/apiResponse.dart';
import 'package:movies_app/models/allMoviesListModel.dart';
import 'package:movies_app/screens/detailedScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiClientResponce client = ApiClientResponce();
  AllMoviesListModel? allMoviesData;

  Future<void> getData() async {
    allMoviesData = await client.getAllMoviesResponce();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b31),
      appBar: AppBar(
        backgroundColor: const Color(0xff2b2b31),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Google Drive Movies',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.dashboard_rounded),
        actions: const [],
      ),

      body: allMoviesData == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 10 / 16),
              itemCount: allMoviesData!.movieRecords!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        getdata: allMoviesData!.movieRecords![index],
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xff2b2b31),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                3, 3), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          image: NetworkImage(
                            "${allMoviesData!.thumbnailUrl.toString()}/${allMoviesData!.movieRecords![index].thumbnail.toString()}",
                          ),
                        ),
                      ),
                      // child: Center(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      // Image.network(
                      //   "${allMoviesData!.thumbnailUrl.toString()}/${allMoviesData!.movieRecords![index].thumbnail.toString()}",
                      //   scale: 0.8,
                      // ),
                      // Text(
                      //   allMoviesData!.movieRecords![index].title
                      //       .toString(),
                      //   style: TextStyle(
                      //       backgroundColor: Colors.black,
                      //       color: Colors.white),
                      // ),
                      //     ],
                      //   ),
                      // ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xff2b2b31),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                3, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            allMoviesData!.movieRecords![index].title
                                .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

///   https://googledrivemovies.in/images/movies/thumbnail1921647790599.jpg
