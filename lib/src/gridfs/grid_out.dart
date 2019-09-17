part of mongo_dart;

class GridOut extends GridFSFile {
  GridOut([Map<String, dynamic> data]) : super(data);

  Future writeToFilename(String filename) {
    return writeToFile(File(filename));
  }

  Future writeToFile(File file) {
    var sink = file.openWrite(mode: FileMode.write);
    writeTo(sink).then((int length) {
      sink.close();
    });
    return sink.done;
  }

  Future<int> writeTo(IOSink out) {
    int length = 0;
    Completer<int> completer = Completer();
    addToSink(Map<String, dynamic> chunk) {
<<<<<<< HEAD
      BsonBinary data = chunk["data"] as BsonBinary;
=======
      final data = chunk["data"] as BsonBinary;
>>>>>>> d7979a940cc266dcfe9a71787c33a923df9e49d2
      out.add(data.byteList);
      length += data.byteList.length;
    }

    fs.chunks
        .find(where.eq("files_id", id).sortBy('n'))
        .forEach(addToSink)
        .then((_) => completer.complete(length));
    return completer.future;
  }
}
