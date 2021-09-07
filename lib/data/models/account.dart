import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  String id;
  String? username;
  String? phone;
  String? avatar;

  Account({
    required this.id,
    this.username,
    this.phone,
    this.avatar
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
