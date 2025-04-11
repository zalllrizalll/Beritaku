// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleHiveAdapter extends TypeAdapter<ArticleHive> {
  @override
  final int typeId = 1;

  @override
  ArticleHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleHive(
      title: fields[0] as String?,
      description: fields[1] as String?,
      urlToImage: fields[2] as String?,
      url: fields[3] as String?,
      content: fields[4] as String?,
      publishedAt: fields[5] as String?,
      author: fields[6] as String?,
      sourceName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.urlToImage)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.publishedAt)
      ..writeByte(6)
      ..write(obj.author)
      ..writeByte(7)
      ..write(obj.sourceName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
