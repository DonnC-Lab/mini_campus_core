import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

final fDptRepProvider = Provider((_) => FacultyDptBaseRepository(_.read));

/// deta base repository
class FacultyDptBaseRepository {
  late final DetaRepository _detaRepository;

  FacultyDptBaseRepository(Reader _read)
      : _detaRepository = DetaRepository(
          baseName: DetaBases.kFacultyDptCollection,
          detaBaseUrl: _read(flavorConfigProvider)['detaBaseUrl'],
        );

  Future<List<FacultyDpt>> getFacultyDptByFaculty(Faculty faculty) async {
    try {
      final res = await _detaRepository.queryBase(
        query: DetaQuery('faculty').equalTo(faculty.name).query,
      );

      List items = res;

      return items.map((e) => FacultyDpt.fromJson(e)).toList();
    }

    // er
    catch (e) {
      debugLogger(e.toString(), name: 'getFacultyDptByFaculty');
    }
    return [];
  }

  Future<List<FacultyDpt>> getAllFacultyDpt() async {
    try {
      final res = await _detaRepository.queryBase();

      List items = res;

      return items.map((e) => FacultyDpt.fromJson(e)).toList();
    }

    // er
    catch (e) {
      debugLogger(e.toString(), name: 'getAllFacultyDpt');
    }
    return [];
  }
}
