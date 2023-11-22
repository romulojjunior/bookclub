import 'package:bookclub/data/api/writer_api.dart';
import 'package:bookclub/domain/entities/writer.dart';

class WriterRepository {
  WriterRepository({required WriterApi writerApi}) {
    _writerApi = writerApi;
  }

  late WriterApi _writerApi;

  Future<List<Writer>> getWriters() {
    return _writerApi.getWriters();
  }
}
