import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model_with_json_serializable.g.dart';

@JsonSerializable()
class ResourceModelWith {
  List<DataWith>? data;

  ResourceModelWith({this.data});

  factory ResourceModelWith.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelWithFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelWithToJson(this);
  }
}

@JsonSerializable()
class DataWith extends Equatable {
  final int? id;
  final String? name;
  final int? year;
  //@JsonKey(name: 'renk')
  final String? color;
  final String? pantoneValue;

  const DataWith(
      {this.id, this.name, this.year, this.color, this.pantoneValue});

  factory DataWith.fromJson(Map<String, dynamic> json) {
    return _$DataWithFromJson(json);
  }

  //@JsonSerializable(createToJson: false)
  Map<String, dynamic> toJson() {
    return _$DataWithToJson(this);
  }

  @override
  List<Object?> get props => [id, name, color];
}
