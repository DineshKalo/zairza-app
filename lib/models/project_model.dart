class Project {
  final String id;
  final String title;
  final DateTime dateAndTime;
  final String wing;
  final String status;
  final String projectImg;
  final String description;
  final String seniorIncharge;
  final List<ProjectLink> links;

  Project({
    required this.id,
    required this.title,
    required this.dateAndTime,
    required this.wing,
    required this.status,
    required this.projectImg,
    required this.description,
    required this.seniorIncharge,
    required this.links,
  });

  // Factory constructor to create a Project from JSON

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['_id'], // Update to match API response
      title: json['title'],
      dateAndTime: DateTime.parse(json['date_and_time']),
      wing: json['wing'],
      status: json['status'],
      projectImg: json['project_img'],
      description: json['description'],
      seniorIncharge: json['senior_incharge'],
      links: (json['links'] as List<dynamic>? ?? [])
          .map((link) => ProjectLink.fromJson(link))
          .toList(),
    );
  }


  // Method to convert a Project to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'date_and_time': dateAndTime.toIso8601String(),
      'wing': wing,
      'status': status,
      'project_img': projectImg,
      'description': description,
      'senior_incharge': seniorIncharge,
      'links': links.map((link) => link.toJson()).toList(),
    };
  }
}

class ProjectLink {
  final String name;
  final String url;
  final String id;

  ProjectLink({
    required this.name,
    required this.url,
    required this.id,
  });

  // Factory constructor to create a ProjectLink from JSON
  factory ProjectLink.fromJson(Map<String, dynamic> json) {
    return ProjectLink(
      name: json['name'],
      url: json['url'],
      id: json['_id'],
    );
  }

  // Method to convert a ProjectLink to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      '_id': id,
    };
  }
}
