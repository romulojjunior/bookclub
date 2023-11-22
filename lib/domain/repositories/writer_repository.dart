import 'package:bookclub/data/api/writer_api.dart';
import 'package:bookclub/domain/entities/writer.dart';

class WriterRepository {
  WriterRepository({required WriterApi writerApi}) {
    _remoteSource = writerApi;
  }

  late WriterApi _remoteSource;

  Future<List<Writer>> getWriters() {
    return _remoteSource.getWriters();
  }
}
