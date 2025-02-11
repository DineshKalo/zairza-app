
class Blog {
  final String id;
  final String title;
  final String description;
  final String wing;
  final String image;
  final int version;

  Blog({
    required this.id,
    required this.title,
    required this.description,
    required this.wing,
    required this.image,
    required this.version,
  });

  // Factory method to create a Blog object from JSON
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      wing: json['wing'] as String,
      image: json['image'] as String,
      version: json['__v'] as int,
    );
  }

  // Method to convert a Blog object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'wing': wing,
      'image': image,
      '__v': version,
    };
  }
}
