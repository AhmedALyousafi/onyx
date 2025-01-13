class GetAllOrdersModel {
  Data? data;
  Result? result;

  GetAllOrdersModel({this.data, this.result});

  factory GetAllOrdersModel.fromJson(Map<String, dynamic> json) {
    return GetAllOrdersModel(
      data: json['Data'] != null ? Data.fromJson(json['Data']) : null,
      result: json['Result'] != null ? Result.fromJson(json['Result']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Data': data?.toJson(),
      'Result': result?.toJson(),
    };
  }
}

class Data {
  UsrActnPrv? usrActnPrv;
  String? scrNm;
  int? pgNo;
  int? pgSz;
  int? pgsCnt;
  int? rowsCnt;
  int? grdClmnsCnt;
  List<GrdClmnsLbl>? grdClmnsLblsLst;
  List<GrdClmnsVal>? grdClmnsValsLst;

  Data({
    this.usrActnPrv,
    this.scrNm,
    this.pgNo,
    this.pgSz,
    this.pgsCnt,
    this.rowsCnt,
    this.grdClmnsCnt,
    this.grdClmnsLblsLst,
    this.grdClmnsValsLst,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      usrActnPrv: json['usrActnPrv'] != null
          ? UsrActnPrv.fromJson(json['usrActnPrv'])
          : null,
      scrNm: json['scrNm'],
      pgNo: json['pgNo'],
      pgSz: json['pgSz'],
      pgsCnt: json['pgsCnt'],
      rowsCnt: json['rowsCnt'],
      grdClmnsCnt: json['grdClmnsCnt'],
      grdClmnsLblsLst: json['grdClmnsLblsLst'] != null
          ? (json['grdClmnsLblsLst'] as List)
              .map((e) => GrdClmnsLbl.fromJson(e))
              .toList()
          : null,
      grdClmnsValsLst: json['grdClmnsValsLst'] != null
          ? (json['grdClmnsValsLst'] as List)
              .map((e) => GrdClmnsVal.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usrActnPrv': usrActnPrv?.toJson(),
      'scrNm': scrNm,
      'pgNo': pgNo,
      'pgSz': pgSz,
      'pgsCnt': pgsCnt,
      'rowsCnt': rowsCnt,
      'grdClmnsCnt': grdClmnsCnt,
      'grdClmnsLblsLst': grdClmnsLblsLst?.map((e) => e.toJson()).toList(),
      'grdClmnsValsLst': grdClmnsValsLst?.map((e) => e.toJson()).toList(),
    };
  }
}

class UsrActnPrv {
  bool? add;
  bool? add2;
  bool? upd;
  bool? del;
  bool? srch;
  bool? prnt;
  bool? import;
  bool? export;

  UsrActnPrv({
    this.add,
    this.add2,
    this.upd,
    this.del,
    this.srch,
    this.prnt,
    this.import,
    this.export,
  });

  factory UsrActnPrv.fromJson(Map<String, dynamic> json) {
    return UsrActnPrv(
      add: json['add'],
      add2: json['add2'],
      upd: json['upd'],
      del: json['del'],
      srch: json['srch'],
      prnt: json['prnt'],
      import: json['import'],
      export: json['export'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'add': add,
      'add2': add2,
      'upd': upd,
      'del': del,
      'srch': srch,
      'prnt': prnt,
      'import': import,
      'export': export,
    };
  }
}

class GrdClmnsLbl {
  String? clmnNm;
  String? lblNm;
  bool? vsbl;

  GrdClmnsLbl({this.clmnNm, this.lblNm, this.vsbl});

  factory GrdClmnsLbl.fromJson(Map<String, dynamic> json) {
    return GrdClmnsLbl(
      clmnNm: json['clmnNm'],
      lblNm: json['lblNm'],
      vsbl: json['vsbl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clmnNm': clmnNm,
      'lblNm': lblNm,
      'vsbl': vsbl,
    };
  }
}

class GrdClmnsVal {
  String? docSrl;
  int? docNo;
  String? docDate;
  int? typNo;
  String? typNoNm;
  String? pymntTypNm;
  String? cstCode;
  String? cstNm;
  String? curCode;
  String? wCodeNm;
  String? refNo;
  String? docDsc;
  String? cstMobileNo;
  String? untNoNm;
  String? apprvdSt;
  String? docNoRefCntrct;

  GrdClmnsVal({
    this.docSrl,
    this.docNo,
    this.docDate,
    this.typNo,
    this.typNoNm,
    this.pymntTypNm,
    this.cstCode,
    this.cstNm,
    this.curCode,
    this.wCodeNm,
    this.refNo,
    this.docDsc,
    this.cstMobileNo,
    this.untNoNm,
    this.apprvdSt,
    this.docNoRefCntrct,
  });

  factory GrdClmnsVal.fromJson(Map<String, dynamic> json) {
    return GrdClmnsVal(
      docSrl: json['DOC_SRL'],
      docNo: json['DOC_NO'],
      docDate: json['DOC_DATE'],
      typNo: json['TYP_NO'],
      typNoNm: json['TYP_NO_NM'],
      pymntTypNm: json['PYMNT_TYP_NM'],
      cstCode: json['CST_CODE'],
      cstNm: json['CST_NM'],
      curCode: json['CUR_CODE'],
      wCodeNm: json['W_CODE_NM'],
      refNo: json['REF_NO'],
      docDsc: json['DOC_DSC'],
      cstMobileNo: json['CST_MOBILE_NO'],
      untNoNm: json['UNT_NO_NM'],
      apprvdSt: json['APPRVD_ST'],
      docNoRefCntrct: json['DOC_NO_REF_CNTRCT'],
    );
  }

  get keys => null;

  Map<String, dynamic> toJson() {
    return {
      'DOC_SRL': docSrl,
      'DOC_NO': docNo,
      'DOC_DATE': docDate,
      'TYP_NO': typNo,
      'TYP_NO_NM': typNoNm,
      'PYMNT_TYP_NM': pymntTypNm,
      'CST_CODE': cstCode,
      'CST_NM': cstNm,
      'CUR_CODE': curCode,
      'W_CODE_NM': wCodeNm,
      'REF_NO': refNo,
      'DOC_DSC': docDsc,
      'CST_MOBILE_NO': cstMobileNo,
      'UNT_NO_NM': untNoNm,
      'APPRVD_ST': apprvdSt,
      'DOC_NO_REF_CNTRCT': docNoRefCntrct,
    };
  }
}

class Result {
  int? errNo;
  String? errMsg;

  Result({this.errNo, this.errMsg});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      errNo: json['errNo'],
      errMsg: json['errMsg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'errNo': errNo,
      'errMsg': errMsg,
    };
  }
}