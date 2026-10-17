// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

class FileEntity {
  final String name;
  final String fileType;
  FileEntity({required this.name, required this.fileType});
}

class GalleryEntity {
  final FileEntity file;
  final Uint8List data;
  GalleryEntity({required this.file, required this.data});
}
