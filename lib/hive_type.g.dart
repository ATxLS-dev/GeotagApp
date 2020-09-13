// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTagFormatAdapter extends TypeAdapter<HiveTagFormat> {
  @override
  final typeId = 0;

  @override
  HiveTagFormat read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTagFormat(
      tagLatitude: fields[0] as double,
      tagLongitude: fields[1] as double,
      tagText: fields[2] as String,
      tagTitle: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTagFormat obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tagLatitude)
      ..writeByte(1)
      ..write(obj.tagLongitude)
      ..writeByte(2)
      ..write(obj.tagText)
      ..writeByte(3)
      ..write(obj.tagTitle);
  }
}
