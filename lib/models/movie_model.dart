class MovieModel {
  int? id;
  String? title;
  String? posterPath;
  double? rating;
  String? overview;
  String? releaseDate;

  MovieModel({
    this.id,
    this.title,
    this.posterPath,
    this.rating,
    this.overview,
    this.releaseDate,
  });

  
  String get posterUrl {
    if (posterPath == null) return "";
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      posterPath: json["poster_path"],
      
      rating: json["vote_average"]?.toDouble(),
      overview: json["overview"],
      releaseDate: json["release_date"],
    );
  }
}