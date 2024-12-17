class Teacher {
  String? acronym;
  String? firstname;
  String? lastname;
  String? mail;
  String? image_url;
  List<String>? subjects;

  Teacher(
      {this.acronym, this.firstname, this.lastname, this.mail, this.image_url, this.subjects});

  Teacher.fromJson(Map<String, dynamic> json) {
    acronym = json['acronym'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mail = json['mail'];
    image_url = json['image_url'];
    subjects = (json['subjects'] as List<dynamic>).cast<String>();
  }
}