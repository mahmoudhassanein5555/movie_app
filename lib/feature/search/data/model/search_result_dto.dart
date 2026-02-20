import 'package:movie_app/feature/search/domain/entites/serach_entities.dart';

class SearchResultsDto {
  int? page;
  List<ResultsDto>? results;
  int? totalPages;
  int? totalResults;

  SearchResultsDto({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  SearchResultsDto.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <ResultsDto>[];
      json['results'].forEach((v) {
        results!.add(ResultsDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  //to entity
  SearchResultsEntity toEntity() => SearchResultsEntity(
    page: page ?? 0,
    results: results?.map((e) => e.toEntity()).toList() ?? [],
    totalPages: totalPages ?? 0,
    totalResults: totalResults ?? 0,
  );
}

class ResultsDto {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  ResultsDto({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  ResultsDto.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null
        ? List<int>.from(json['genre_ids'])
        : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = (json['popularity'] as num?)?.toDouble();
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    voteCount = json['vote_count'];
  }
  ResultsEntity toEntity() => ResultsEntity(
    adult: adult ?? false,
    backdropPath: backdropPath ?? '',
    genreIds: genreIds ?? [],
    id: id ?? 0,
    originalLanguage: originalLanguage ?? '',
    originalTitle: originalTitle ?? '',
    overview: overview ?? '',
    popularity: popularity ?? 0.0,
    posterPath: posterPath ?? '',
    releaseDate: releaseDate ?? '',
    title: title ?? '',
    video: video ?? false,
    voteAverage: voteAverage ?? 0.0,
    voteCount: voteCount ?? 0,
  );
}
