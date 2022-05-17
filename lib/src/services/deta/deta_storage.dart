import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_core_constants/mc_core_constants.dart';
import 'package:mini_campus_core_libs/mini_campus_core_libs.dart';

final detaStorageProvider =
    ProviderFamily<DetaStorageRepository, DetaDriveInit>((ref, detaDriveInit) {
  return DetaStorageRepository(detaDriveInit);
});

final detaStorageFileDownloaderProvider =
    FutureProviderFamily<dynamic, DetaDriveInit>((ref, detaDriveInit) {
  return DetaStorageRepository(detaDriveInit).download(detaDriveInit.filename!);
});

class DetaStorageRepository {
  final DetaDriveInit detaDriveInit;

  late final DetaRepository _detaRepository;

  DetaStorageRepository(this.detaDriveInit)
      : _detaRepository = DetaRepository(
          driveName: detaDriveInit.drive,
          baseName: detaDriveInit.base,
          detaBaseUrl: detaBaseUrl,
        );

  Future getAllFiles({
    int limit = 1000,
    String prefix = '',
    String? last,
  }) async {
    final files = await _detaRepository.listFiles(
        last: last, limit: limit, prefix: prefix);

    if (files is DetaRepositoryException) {
      throw files;
    }

    return files;
  }

  Future download(String filename) async {
    final fileByte = await _detaRepository.downloadFile(filename);

    if (fileByte is DetaRepositoryException) {
      throw fileByte;
    }

    return fileByte;
  }

  Future delete(String file) async {
    final resp = await _detaRepository.deleteFiles(file);

    if (resp is DetaRepositoryException) {
      throw resp;
    }

    return resp;
  }

  Future upload(
    String file, {
    String? directory,
    String? filename,
  }) async {
    final resp = await _detaRepository.uploadFile(file,
        directory: directory, filename: filename);

    if (resp is DetaRepositoryException) {
      throw resp;
    }

    return resp;
  }
}
