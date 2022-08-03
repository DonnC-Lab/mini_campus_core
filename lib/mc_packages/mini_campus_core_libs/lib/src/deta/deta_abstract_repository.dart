abstract class DetaRepositoryImp {
  Future queryBase({Map? query});

  Future addBaseData(Map payload, {String key = ''});

  Future deleteBaseData(Map payload, {String? key});

  Future uploadFile(String filePath, {String? directory, String? filename});

  Future downloadFile(String fileName);

  Future listFiles({int limit = 1000, String prefix = '', String? last});

  Future deleteFiles(String filename);
}
