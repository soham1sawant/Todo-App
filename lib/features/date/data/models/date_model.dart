import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'date_model.g.dart';

@JsonSerializable()
class DateModel extends Equatable {
  final String month;
  final String date;
  final String year;

  const DateModel(this.month, this.date, this.year);


  factory DateModel.fromJson(Map<String, dynamic> json) =>
      _$DateModelFromJson(json);

  Map<String, dynamic> toJson() => _$DateModelToJson(this);

  @override
  List<Object?> get props => [month, date, year];
}
