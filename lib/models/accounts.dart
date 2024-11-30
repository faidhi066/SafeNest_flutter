import 'package:json_annotation/json_annotation.dart';

part 'accounts.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: 'account_id')
  final String accountId;

  @JsonKey(name: 'bic_code')
  final String bicCode;

  @JsonKey(name: 'provider_type')
  final String providerType;

  @JsonKey(name: 'account_number')
  final String accountNumber;

  @JsonKey(name: 'account_type')
  final String accountType;

  @JsonKey(name: 'account_description')
  final String accountDescription;

  @JsonKey(name: 'account_holder_full_name')
  final String accountHolderFullName;

  @JsonKey(name: 'id_type')
  final String idType;

  @JsonKey(name: 'id_value')
  final String idValue;

  @JsonKey(name: 'account_holder_email_address')
  final String? accountHolderEmailAddress;

  @JsonKey(name: 'account_holder_mobile_number')
  final String? accountHolderMobileNumber;

  @JsonKey(name: 'product_type')
  final String productType;

  @JsonKey(name: 'sharia_compliance')
  final String shariaCompliance;

  @JsonKey(name: 'user_id')
  final int? userId;

  Account({
    required this.accountId,
    required this.bicCode,
    required this.providerType,
    required this.accountNumber,
    required this.accountType,
    required this.accountDescription,
    required this.accountHolderFullName,
    required this.idType,
    required this.idValue,
    this.accountHolderEmailAddress,
    this.accountHolderMobileNumber,
    required this.productType,
    required this.shariaCompliance,
    this.userId,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
