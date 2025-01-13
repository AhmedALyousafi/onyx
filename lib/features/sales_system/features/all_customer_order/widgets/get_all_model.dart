class GetAllModel {
  final Data data;
  final Result result;

  GetAllModel({required this.data, required this.result});

  factory GetAllModel.fromJson(Map<String, dynamic> json) {
    return GetAllModel(
      data: Data.fromJson(json['Data']),
      result: Result.fromJson(json['Result']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Data': data.toJson(),
      'Result': result.toJson(),
    };
  }
}

class Data {
  final UsrActnPrv usrActnPrv;
  final String scrNm;
  final dynamic pgNo;
  final dynamic pgSz;
  final dynamic pgsCnt;
  final int rowsCnt;
  final int grdClmnsCnt;
  final List<GrdClmnsLbl> grdClmnsLblsLst;
  final List<GrdClmnsVals> grdClmnsValsLst;

  Data({
    required this.usrActnPrv,
    required this.scrNm,
    this.pgNo,
    this.pgSz,
    this.pgsCnt,
    required this.rowsCnt,
    required this.grdClmnsCnt,
    required this.grdClmnsLblsLst,
    required this.grdClmnsValsLst,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var grdClmnsLblsList = (json['grdClmnsLblsLst'] as List)
        .map((e) => GrdClmnsLbl.fromJson(e))
        .toList();
    var grdClmnsValsList = (json['grdClmnsValsLst'] as List)
        .map((e) => GrdClmnsVals.fromJson(e))
        .toList();
    return Data(
      usrActnPrv: UsrActnPrv.fromJson(json['usrActnPrv']),
      scrNm: json['scrNm'],
      pgNo: json['pgNo'],
      pgSz: json['pgSz'],
      pgsCnt: json['pgsCnt'],
      rowsCnt: json['rowsCnt'],
      grdClmnsCnt: json['grdClmnsCnt'],
      grdClmnsLblsLst: grdClmnsLblsList,
      grdClmnsValsLst: grdClmnsValsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usrActnPrv': usrActnPrv.toJson(),
      'scrNm': scrNm,
      'pgNo': pgNo,
      'pgSz': pgSz,
      'pgsCnt': pgsCnt,
      'rowsCnt': rowsCnt,
      'grdClmnsCnt': grdClmnsCnt,
      'grdClmnsLblsLst': grdClmnsLblsLst.map((e) => e.toJson()).toList(),
      'grdClmnsValsLst': grdClmnsValsLst.map((e) => e.toJson()).toList(),
    };
  }
}

class UsrActnPrv {
  final bool add;
  final bool add2;
  final bool upd;
  final bool del;
  final bool srch;
  final bool prnt;
  final bool import;
  final bool export;

  UsrActnPrv({
    required this.add,
    required this.add2,
    required this.upd,
    required this.del,
    required this.srch,
    required this.prnt,
    required this.import,
    required this.export,
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
  final String clmnNm;
  final String? lblNm;
  final bool vsbl;

  GrdClmnsLbl({
    required this.clmnNm,
    this.lblNm,
    required this.vsbl,
  });

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

class GrdClmnsVals {
  final String DOC_SRL;
  final int DOC_NO;
  final String DOC_DATE;
  final int TYP_NO;
  final String TYP_NO_NM;
  final String PYMNT_TYP_NM;
  final String CST_CODE;
  final String CST_NM;
  final String CUR_CODE;
  final String W_CODE_NM;
  final String? REF_NO;
  final String DOC_DSC;
  final String? CST_MOBILE_NO;
  final String UNT_NO_NM;
  final String APPRVD_ST;
  final String? DOC_NO_REF_CNTRCT;

  GrdClmnsVals({
    required this.DOC_SRL,
    required this.DOC_NO,
    required this.DOC_DATE,
    required this.TYP_NO,
    required this.TYP_NO_NM,
    required this.PYMNT_TYP_NM,
    required this.CST_CODE,
    required this.CST_NM,
    required this.CUR_CODE,
    required this.W_CODE_NM,
    this.REF_NO,
    required this.DOC_DSC,
    this.CST_MOBILE_NO,
    required this.UNT_NO_NM,
    required this.APPRVD_ST,
    this.DOC_NO_REF_CNTRCT,
  });

  factory GrdClmnsVals.fromJson(Map<String, dynamic> json) {
    return GrdClmnsVals(
      DOC_SRL: json['DOC_SRL'],
      DOC_NO: json['DOC_NO'],
      DOC_DATE: json['DOC_DATE'],
      TYP_NO: json['TYP_NO'],
      TYP_NO_NM: json['TYP_NO_NM'],
      PYMNT_TYP_NM: json['PYMNT_TYP_NM'],
      CST_CODE: json['CST_CODE'],
      CST_NM: json['CST_NM'],
      CUR_CODE: json['CUR_CODE'],
      W_CODE_NM: json['W_CODE_NM'],
      REF_NO: json['REF_NO'],
      DOC_DSC: json['DOC_DSC'],
      CST_MOBILE_NO: json['CST_MOBILE_NO'],
      UNT_NO_NM: json['UNT_NO_NM'],
      APPRVD_ST: json['APPRVD_ST'],
      DOC_NO_REF_CNTRCT: json['DOC_NO_REF_CNTRCT'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DOC_SRL': DOC_SRL,
      'DOC_NO': DOC_NO,
      'DOC_DATE': DOC_DATE,
      'TYP_NO': TYP_NO,
      'TYP_NO_NM': TYP_NO_NM,
      'PYMNT_TYP_NM': PYMNT_TYP_NM,
      'CST_CODE': CST_CODE,
      'CST_NM': CST_NM,
      'CUR_CODE': CUR_CODE,
      'W_CODE_NM': W_CODE_NM,
      'REF_NO': REF_NO,
      'DOC_DSC': DOC_DSC,
      'CST_MOBILE_NO': CST_MOBILE_NO,
      'UNT_NO_NM': UNT_NO_NM,
      'APPRVD_ST': APPRVD_ST,
      'DOC_NO_REF_CNTRCT': DOC_NO_REF_CNTRCT,
    };
  }
}

class Result {
  final int errNo;
  final String errMsg;

  Result({required this.errNo, required this.errMsg});

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
