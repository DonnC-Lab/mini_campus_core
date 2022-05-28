// universities email domains
enum Uni {
  None,
  NUST,
}

class McUniEmailDomain {
  final String domain;
  final Uni university;

  McUniEmailDomain(
    this.domain, {
    this.university = Uni.NUST,
  });

  static List<McUniEmailDomain> get uniDomains => [
        McUniEmailDomain('@students.nust.ac.zw'),
      ];
}
