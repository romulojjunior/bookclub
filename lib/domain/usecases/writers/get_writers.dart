import 'package:bookclub/domain/entities/writer.dart';
import 'package:bookclub/domain/repositories/writer_repository.dart';

class GetWritersUC {
  GetWritersUC({required WriterRepository writerReposiotry}) {
    _writerReposiotry = writerReposiotry;
  }

  late WriterRepository _writerReposiotry;

  Future<List<Writer>> execute() {
    return _writerReposiotry.getWriters();
  }
}
