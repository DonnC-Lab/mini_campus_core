import 'index.dart';

class Faculty {
  final String name;
  final Uni uni;

  Faculty({this.name = '', this.uni = Uni.NUST});

  List<Faculty> get uniFaculties {
    switch (uni) {
      case Uni.NUST:
        return NustFaculty.faculties;
      default:
        return const [];
    }
  }
}

class NustFaculty extends Faculty {
  NustFaculty(String name) : super();

  static List<NustFaculty> get faculties => [
        NustFaculty('Engineering'),
        NustFaculty('Applied Science'),
        NustFaculty('Built Environment'),
        NustFaculty('Commerce'),
        NustFaculty('Comm & Information Scie'),
        NustFaculty('Medicine'),
        NustFaculty('Science & Tech Education'),
      ];
}
