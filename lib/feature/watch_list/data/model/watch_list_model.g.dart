// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchListModelAdapter extends TypeAdapter<WatchListModel> {
  @override
  final int typeId = 0;

  @override
  WatchListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchListModel(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
      releaseDate: fields[3] as String,
      voteAverage: fields[4] as double,
      genre: fields[5] as String,
      runtime: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WatchListModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.releaseDate)
      ..writeByte(4)
      ..write(obj.voteAverage)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.runtime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
