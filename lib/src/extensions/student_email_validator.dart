// validate student email(s) here

import 'package:mini_campus_core/mc_packages/index.dart';

extension ValidateStudentEmail on String {
  bool get isValidStudentEmailAddress => McUniEmailDomain.uniDomains
      .any((domainUni) => trim().endsWith(domainUni.domain));
}
