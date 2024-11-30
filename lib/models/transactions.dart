class Transactions {
  final String transactionId;
  final String accountId;
  final String? bicCode;
  final String? accountNumber;
  final String? accountType;
  final String? paymentScheme;
  final String? creditDebitIndicator;
  final String? transactionType;
  final double? transactionAmount;
  final String? transactionCurrency;
  final double? accountCurrencyAmount;
  final String? accountCurrency;
  final double? fxRate;
  final String? status;
  final DateTime? bookingDatetime;
  final DateTime? valueDatetime;
  final String? merchantCategoryCode;
  final String? merchantName;
  final String? merchantAddress;
  final String? merchantPostalCode;
  final String? merchantCity;
  final String? merchantCountry;
  final String? category;
  final String? categoryPurposeCode;
  final String? businessCategoryCodes;
  final String? msic;
  final String? billerCode;
  final String? billerCodeName;
  final String? creditorBic;
  final String? creditorAgentName;
  final String? creditorAccountNumber;
  final String? creditorAccountName;
  final String? debitorBic;
  final String? debitorAgentName;
  final String? debitorAccountNumber;
  final String? debitorName;

  // Initial parameters retained from the original model
  final String name;
  final String amount;
  final String date;
  final String type;
  final bool isReceived;

  Transactions({
    required this.transactionId,
    required this.accountId,
    this.bicCode,
    this.accountNumber,
    this.accountType,
    this.paymentScheme,
    this.creditDebitIndicator,
    this.transactionType,
    this.transactionAmount,
    this.transactionCurrency,
    this.accountCurrencyAmount,
    this.accountCurrency,
    this.fxRate,
    this.status,
    this.bookingDatetime,
    this.valueDatetime,
    this.merchantCategoryCode,
    this.merchantName,
    this.merchantAddress,
    this.merchantPostalCode,
    this.merchantCity,
    this.merchantCountry,
    this.category,
    this.categoryPurposeCode,
    this.businessCategoryCodes,
    this.msic,
    this.billerCode,
    this.billerCodeName,
    this.creditorBic,
    this.creditorAgentName,
    this.creditorAccountNumber,
    this.creditorAccountName,
    this.debitorBic,
    this.debitorAgentName,
    this.debitorAccountNumber,
    this.debitorName,
    required this.name,
    required this.amount,
    required this.date,
    required this.type,
    required this.isReceived,
  });
}
