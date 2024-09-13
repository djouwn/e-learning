class Course {
  final String? id;
  final String? tutorId;
  final String? title;
  final String? description;
  final String? requirements;
  final String? imageUrl;

  Course({
    this.id,
    this.tutorId,
    this.title,
    this.description,
    this.requirements,
    this.imageUrl,
  });

  factory Course.fromJson(List<dynamic> json) {
    return Course(
      id: json[0] ?? '',
      tutorId: json[1] ?? '',
      title: json[2] ?? '',
      description: json[3] ?? '',
      requirements: json[4] ?? '',
      imageUrl: json[5] ?? '',
    );
  }



  bool hasTutor(String tutorId) {
    return this.tutorId == tutorId;
  }

  fromJson() {}
}

class Tutor {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? imageUrl;
  final bool? isActive;

  Tutor({
    this.id,
    this.name,
    this.email,
    this.password,
    this.imageUrl,
    this.isActive,
  });

  factory Tutor.fromJson(List<dynamic> json) {
    return Tutor(
      id: json[0] ?? '',
      name: json[1] ?? '',
      email: json[2] ?? '',
      password: json[3] ?? '',
      imageUrl: json[4] ?? '',
      isActive: json[5] ?? false,
    );
  }

  fromJson() {}
}
