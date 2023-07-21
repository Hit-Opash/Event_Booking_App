// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['eventTitle'] as String,
      json['eventDate'] as String,
      json['eventStartTime'] as String,
      json['eventEndTime'] as String,
      json['eventVenue'] as String,
      json['eventAddress'] as String,
      json['eventDesc'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventTitle': instance.eventTitle,
      'eventDate': instance.eventDate,
      'eventStartTime': instance.eventStartTime,
      'eventEndTime': instance.eventEndTime,
      'eventVenue': instance.eventVenue,
      'eventAddress': instance.eventAddress,
      'eventDesc': instance.eventDesc,
    };
