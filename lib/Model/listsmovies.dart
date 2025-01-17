// ignore_for_file: file_names

class MovieGenre {
  final int id;
  final String name;

  MovieGenre({required this.id, required this.name});

  factory MovieGenre.fromJson(Map<String, dynamic> json) {
    return MovieGenre(id: json['id'], name: json['name']);
  }
}
