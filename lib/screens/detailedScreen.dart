import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final getdata;

  const DetailsScreen({Key? key, this.getdata}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.getdata.title.toString()),
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xff2b2b31),
          ),
          // Center(
          //   child: Container(
          //     margin: const EdgeInsets.all(6.0),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(25.0),
          //       color: Colors.blue.shade500,
          //       gradient: const LinearGradient(
          //           begin: Alignment.topRight,
          //           end: Alignment.bottomLeft,
          //           colors: [
          //             Color(0xffcbb545),
          //             Color(0xffb05042),
          //           ]),
          //     ),
          //     height: 380.0,
          //     width: 300.0,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              Container(
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            'https://googledrivemovies.in/images/movies/thumbnail/${widget
                                .getdata.thumbnail.toString()}'))),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.getdata.title.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 20,
              ),
              Text(
                'Director  :  ${widget.getdata.directors.toString()}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Cast  :  ${widget.getdata.cast.toString()}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Writers  :  ${widget.getdata.writers.toString()}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Description  :  ${widget.getdata.description.toString()}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Download'),
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 50)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Watch Trailer'),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 50),
                    backgroundColor: Colors.red),
              )

            ],
          )
        ],
      ),
    );
  }
}
