// validate student email(s) here

import 'package:mc_core_constants/mc_core_constants.dart';

extension ValidateStudentEmail on String {
  bool get isValidStudentEmail => trim().endsWith(nustEmailDomain);

  bool get isValidStudentEmailAddress => trim().endsWith(nustEmailDomain);
}
