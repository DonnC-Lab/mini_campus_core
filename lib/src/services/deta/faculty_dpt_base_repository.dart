import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_core_constants/mc_core_constants.dart';
import 'package:mini_campus_core/mini_campus_core.dart';
import 'package:mini_campus_core_libs/mini_campus_core_libs.dart';

final fDptRepProvider = Provider((_) => FacultyDptBaseRepository());

/// deta base repository
class FacultyDptBaseRepository {
  static final DetaRepository _detaRepository = DetaRepository(
    baseName: DetaBases.facultyDpt,
    detaBaseUrl: detaBaseUrl,
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
