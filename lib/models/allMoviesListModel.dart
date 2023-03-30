class AllMoviesListModel {
  bool? status;
  int? count;
  String? thumbnailUrl;
  List<MovieRecords>? movieRecords;

  AllMoviesListModel(
      {this.status, this.count, this.thumbnailUrl, this.movieRecords});

  AllMoviesListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    thumbnailUrl = json['thumbnail_url'];
    if (json['movie_records'] != null) {
      movieRecords = <MovieRecords>[];
      json['movie_records'].forEach((v) {
        movieRecords!.add(MovieRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    data['thumbnail_url'] = thumbnailUrl;
    if (movieRecords != null) {
      data['movie_records'] =
          movieRecords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieRecords {
  String? categoryId;
  String? title;
  String? categoryType;
  String? description;
  String? thumbnail;
  String? images;
  String? downloadUrl;
  String? trailerUrl;
  String? directors;
  String? writers;
  String? cast;

  MovieRecords(
      {this.categoryId,
        this.title,
        this.categoryType,
        this.description,
        this.thumbnail,
        this.images,
        this.downloadUrl,
        this.trailerUrl,
        this.directors,
        this.writers,
        this.cast});

  MovieRecords.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    title = json['title'];
    categoryType = json['category_type'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    images = json['images'];
    downloadUrl = json['download_url'];
    trailerUrl = json['trailer_url'];
    directors = json['directors'];
    writers = json['writers'];
    cast = json['cast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['title'] = title;
    data['category_type'] = categoryType;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    data['download_url'] = downloadUrl;
    data['trailer_url'] = trailerUrl;
    data['directors'] = directors;
    data['writers'] = writers;
    data['cast'] = cast;
    return data;
  }
}