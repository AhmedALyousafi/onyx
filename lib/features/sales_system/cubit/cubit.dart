import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/core/model/models/get_all_ordersm_model.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/features/sales_system/cubit/state.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomerOrdersCubit extends Cubit<CustomerOrdersState> {
  CustomerOrdersCubit([CustomerOrdersState? state])
      : super(CustomerOrdersState());

  List<PlutoColumn> columns = [];
  List<PlutoRow> rows = [];
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signInId = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  void selectcash(bool value) {
    return emit(state.copyWith(cash: value));
  }

  void selectbank(bool value) {
    return emit(state.copyWith(bank: value));
  }

  void selectcredit(bool value) {
    return emit(state.copyWith(credit: value));
  }

  void selectaccount(bool value) {
    return emit(state.copyWith(account: value));
  }

  void selectBankvisible(bool value) {
    return emit(state.copyWith(isBankFieldVisible: value));
  }

  void selectadditional(bool value) {
    return emit(state.copyWith(additional: value));
  }

  void selectcheek(String value) {
    if (value == 'شيك') {
      return emit(state.copyWith(
        cheek: true,
        trans: false,
        creditcard: false,
      ));
    }
  }

  void selectcreditCard(String value) {
    if (value == 'بطاقة الائتمان') {
      return emit(state.copyWith(
        creditcard: true,
        trans: false,
        cheek: false,
      ));
    }
  }

  void selecttrans(String value) {
    if (value == 'تحويل') {
      return emit(state.copyWith(
        trans: true,
        creditcard: false,
        cheek: false,
      ));
    }
  }

  void selectmonth(String value) {
    if (value == 'طريقة التوزيع*') {
      return emit(state.copyWith(
        month: true,
        day: false,
      ));
    }
  }

  void selectday(String value) {
    if (value == 'طريقة التوزيع*') {
      return emit(state.copyWith(
        month: false,
        day: true,
      ));
    }
  }

  void selectisBankFieldVisible(String value) {
    if (value == 'شيك') {
      return emit(state.copyWith(
        isBankFieldVisible: true,
      ));
    }
  }
}
