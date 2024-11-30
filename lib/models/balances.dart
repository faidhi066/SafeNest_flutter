import 'package:json_annotation/json_annotation.dart';

part 'balances.g.dart';

@JsonSerializable()
class Balance {
  @JsonKey(name: 'account_detail_id')
  final int accountDetailId;

  @JsonKey(name: 'account_id')
  final String accountId;

  @JsonKey(name: 'account_balance_datetime')
  final DateTime accountBalanceDatetime;

  @JsonKey(name: 'outstanding_balance')
  final double? outstandingBalance;

  @JsonKey(name: 'pending_balance')
  final double? pendingBalance;

  @JsonKey(name: 'available_balance')
  final double? availableBalance;

  @JsonKey(name: 'credit_limit')
  final double? creditLimit;

  @JsonKey(name: 'account_currency')
  final String accountCurrency;

  @JsonKey(name: 'repayment_due_date')
  final DateTime? repaymentDueDate;

  @JsonKey(name: 'repayment_amount_due')
  final double? repaymentAmountDue;

  @JsonKey(name: 'repayment_frequency')
  final String? repaymentFrequency;

  @JsonKey(name: 'maturity_date')
  final DateTime? maturityDate;

  Balance({
    required this.accountDetailId,
    required this.accountId,
    required this.accountBalanceDatetime,
    this.outstandingBalance,
    this.pendingBalance,
    this.availableBalance,
    this.creditLimit,
    required this.accountCurrency,
    this.repaymentDueDate,
    this.repaymentAmountDue,
    this.repaymentFrequency,
    this.maturityDate,
  });

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}
