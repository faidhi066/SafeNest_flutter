import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'middle_name')
  final String? middleName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'date_of_birth')
  final DateTime? dateOfBirth;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'profile_picture_url')
  final String? profilePictureUrl;

  @JsonKey(name: 'address_line_1')
  final String? addressLine1;

  @JsonKey(name: 'address_line_2')
  final String? addressLine2;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'postal_code')
  final String? postalCode;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'is_active')
  final bool? isActive;

  @JsonKey(name: 'is_verified')
  final bool? isVerified;

  @JsonKey(name: 'last_login')
  final DateTime? lastLogin;

  @JsonKey(name: 'role')
  final String? role;

  @JsonKey(name: 'password_reset_token')
  final String? passwordResetToken;

  @JsonKey(name: 'password_reset_expiration')
  final DateTime? passwordResetExpiration;

  @JsonKey(name: 'preferences')
  final Map<String, dynamic>? preferences;

  @JsonKey(name: 'language')
  final String? language;

  @JsonKey(name: 'timezone')
  final String? timezone;

  @JsonKey(name: 'subscription_status')
  final String? subscriptionStatus;

  @JsonKey(name: 'loyalty_points')
  final int? loyaltyPoints;

  @JsonKey(name: 'create_date')
  final DateTime? createDate;

  @JsonKey(name: 'updated_date')
  final DateTime? updatedDate;

  @JsonKey(name: 'deleted_date')
  final DateTime? deletedDate;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.middleName,
    required this.email,
    required this.password,
    this.dateOfBirth,
    this.phoneNumber,
    this.gender,
    this.profilePictureUrl,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.isActive,
    this.isVerified,
    this.lastLogin,
    this.role,
    this.passwordResetToken,
    this.passwordResetExpiration,
    this.preferences,
    this.language,
    this.timezone,
    this.subscriptionStatus,
    this.loyaltyPoints,
    this.createDate,
    this.updatedDate,
    this.deletedDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
