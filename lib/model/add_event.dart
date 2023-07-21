import 'package:json_annotation/json_annotation.dart';
part 'add_event.g.dart';

@JsonSerializable()
class Event {
  Event(this.eventTitle, this.eventDate, this.eventStartTime, this.eventEndTime,
      this.eventVenue, this.eventAddress, this.eventDesc);

  final String eventTitle;
  final String eventDate;
  final String eventStartTime;
  final String eventEndTime;
  final String eventVenue;
  final String eventAddress;
  final String eventDesc;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
