import 'package:flutter/material.dart';
import 'package:latifa_day8_homework/models/movie_model.dart';
import 'package:latifa_day8_homework/services/api.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies This Week"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A1A2E), Color(0xFF0E0E12)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                movie.posterUrl,
                height: 300,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.movie, size: 100),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? "No title",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, size: 18, color: Colors.amber),
                      SizedBox(width: 4),
                      Text("${movie.rating?.toStringAsFixed(1) ?? "-"} / 10"),
                      SizedBox(width: 16),
                      Icon(Icons.calendar_today, size: 16),
                      SizedBox(width: 4),
                      Text(movie.releaseDate ?? "-"),
                    ],
                  ),
                  SizedBox(height: 8),

                 
                  FutureBuilder<int?>(
                    future: Api().getRuntime(movie.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading runtime...");
                      }
                      if (snapshot.hasError) {
                        return Text("Runtime unavailable");
                      }
                      return Row(
                        children: [
                          Icon(Icons.access_time, size: 16),
                          SizedBox(width: 4),
                          Text("${snapshot.data ?? "-"} minutes"),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: 16),
                  Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    movie.overview == null || movie.overview!.isEmpty
                        ? "No overview available."
                        : movie.overview!,
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}