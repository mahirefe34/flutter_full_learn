// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model_with_json_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModelWith _$ResourceModelWithFromJson(Map<String, dynamic> json) =>
    ResourceModelWith(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataWith.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourceModelWithToJson(ResourceModelWith instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataWith _$DataWithFromJson(Map<String, dynamic> json) => DataWith(
      id: json['id'] as int?,
      name: json['name'] as String?,
      year: json['year'] as int?,
      color: json['color'] as String?,
      pantoneValue: json['pantoneValue'] as String?,
    );

Map<String, dynamic> _$DataWithToJson(DataWith instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantoneValue': instance.pantoneValue,
    };
