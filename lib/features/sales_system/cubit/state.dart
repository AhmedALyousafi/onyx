import 'package:onyx/features/sales_system/features/all_customer_order/widgets/get_all_model.dart';

class CustomerOrdersState {
  final bool haedproductgrid;
  final bool calculator;
  final bool settingMultiablePayment;
  final bool plutogridwidget;
  final bool cash;
  final bool bank;
  final bool credit;
  final bool account;
  final bool additional;

  final bool cheek;
  final bool trans;
  final bool creditcard;
  final bool month;
  final bool day;
  final bool isBankFieldVisible;

  final bool isLoading;
  final String? error;
  final GetAllModel? getAllModel;

  CustomerOrdersState({
    this.calculator = false,
    this.haedproductgrid = false,
    this.settingMultiablePayment = false,
    this.plutogridwidget = false,
    this.cash = false,
    this.bank = false,
    this.credit = false,
    this.account = false,
    this.additional = false,
    this.cheek = false,
    this.creditcard = false,
    this.trans = false,
    this.month = false,
    this.day = false,
    this.isBankFieldVisible = false,
    this.isLoading = false,
    this.error,
    this.getAllModel,
  });

  get selectitemdata => null;
  CustomerOrdersState copyWith({
    bool? calculator,
    bool? haedproductgrid,
    bool? settingMultiablePayment,
    bool? plutogridwidget,
    bool? cash,
    bool? bank,
    bool? credit,
    bool? account,
    bool? additional,
    bool? cheek,
    bool? creditcard,
    bool? trans,
    bool? month,
    bool? day,
    bool? isBankFieldVisible,
    bool? isLoading,
    String? error,
    GetAllModel? getAllModel,
  }) {
    return CustomerOrdersState(
      calculator: calculator ?? this.calculator,
      haedproductgrid: haedproductgrid ?? this.haedproductgrid,
      settingMultiablePayment:
          settingMultiablePayment ?? this.settingMultiablePayment,
      plutogridwidget: plutogridwidget ?? this.plutogridwidget,
      cash: cash ?? this.cash,
      bank: bank ?? this.bank,
      additional: additional ?? this.additional,
      account: account ?? this.account,
      credit: credit ?? this.credit,
      cheek: cheek ?? this.cheek,
      creditcard: creditcard ?? this.creditcard,
      trans: trans ?? this.trans,
      month: month ?? this.month,
      day: day ?? this.day,
      isBankFieldVisible: isBankFieldVisible ?? this.isBankFieldVisible,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      getAllModel: getAllModel ?? this.getAllModel,
    );
  }
}

final class UserInitial extends CustomerOrdersState {}

final class SignInSuccess extends CustomerOrdersState {}

final class UploadProfilePic extends CustomerOrdersState {}

final class SignInLoading extends CustomerOrdersState {}

final class SignInFailure extends CustomerOrdersState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignUpSuccess extends CustomerOrdersState {}

final class SignUpLoading extends CustomerOrdersState {}

final class SignUpFailure extends CustomerOrdersState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class GetUserLoading extends CustomerOrdersState {}
