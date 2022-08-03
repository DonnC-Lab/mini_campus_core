import 'package:mini_campus_core/mc_packages/index.dart';

import '../index.dart';

/// get all relevent student topic based on student profile

/// proper topics
///
/// [
///   gender,
///   all
///   dptCode,
///   faculty,
///   enrollment year - part 1 part 2...
///   uni
/// ]
///
class NotificationTopic {
  final Student student;

  final Uni university;

  late List<String> _topics;

  NotificationTopic({required this.student, this.university = Uni.NUST}) {
    _topics = [];
    _computeTopics();
  }

  List<String> get topics => _topics;

  void _computeTopics() {
    _topics = ['all'];

    _topics.add(student.departmentCode);

    _topics.add(student.gender!);

    _topics.add(university.name.toUpperCase());

    _topics.add(student.faculty);

    _topics.add(getStudentNumberFromEmail(
            student.email,
            McUniEmailDomain.uniDomains
                .firstWhere((uni) => uni.university == university))!
        .stringYear);
  }
}
