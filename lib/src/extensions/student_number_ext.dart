// get student number from passed email

import 'package:mini_campus_core/mc_packages/index.dart';

class StudentNumber {
  final String stringYear;
  final int intYear;
  final String studentNumber;

  StudentNumber(
      {this.stringYear = '', this.intYear = 0, this.studentNumber = ''});

  StudentNumber copyWith({
    String? stringYear,
    int? intYear,
    String? studentNumber,
  }) {
    return StudentNumber(
      stringYear: stringYear ?? this.stringYear,
      intYear: intYear ?? this.intYear,
      studentNumber: studentNumber ?? this.studentNumber,
    );
  }

  @override
  String toString() =>
      'StudentNumber(stringYear: $stringYear, intYear: $intYear, studentNumber: $studentNumber)';
}

/// autocompute student number, part and enrollment year
StudentNumber? getStudentNumberFromEmail(
    String studentEmail, McUniEmailDomain uniDomain) {
  // full uni student number
  String? studentNumber;

  // student auto computed enrollment year e.g 2019
  int? _enrollmentYear;

  // different logic tricks to auto get student number and enrollment year from student email
  switch (uniDomain.university) {
    case Uni.NUST:
      studentNumber = studentEmail.replaceAll(uniDomain.domain, '').trim();
      final _year = studentNumber.substring(2, 4).trim();
      _enrollmentYear = int.tryParse('20$_year');
      break;

    // other supported unis
    default:
  }

  if (studentNumber == null || _enrollmentYear == null) {
    return null;
  }

  StudentNumber sn = StudentNumber(studentNumber: studentNumber);

  try {
    // minus
    final today = DateTime.now().year;

    int diff = today - _enrollmentYear;

    String _studentY = '';

    switch (diff) {
      case 0:
        _studentY = 'Part 1';
        break;

      case 1:
        _studentY = 'Part 1';
        break;

      case 2:
        _studentY = 'Part 2';
        break;

      case 3:
        _studentY = 'Part 3';
        break;

      case 4:
        _studentY = 'Part 4';
        break;

      case 5:
        _studentY = 'Part 5';
        break;

      case 6:
        _studentY = 'Part 6';
        break;

      case 7:
        _studentY = 'Part 7';
        break;

      case 8:
        _studentY = 'Part 8';
        break;

      case 9:
        _studentY = 'Part 9';
        break;

      default:
        _studentY = 'undefined';
    }

    sn = sn.copyWith(stringYear: _studentY.toLowerCase(), intYear: diff);
  }

  // error
  catch (e) {
    // pass
  }

  return sn;
}
