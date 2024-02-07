import 'dart:isolate';

import 'package:bookclub/data/samples/writer_samples.dart';
import 'package:bookclub/domain/entities/writer.dart';

class WriterApi {
  Future<List<Writer>> getWriters() {
    return Future.delayed(const Duration(seconds: 1), () {
      return Isolate.run(() {
        return WriterSamples.getSamples().map((e) {
          return Writer.fromMap(e);
        }).toList();
      });
    });
  }
}
