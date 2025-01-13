
// class QueryRequest {
//   final int doctyp;
//   final int scrNo;
//   final int untNo;
//   final int sysNo;
//   final int sysTyp;
//   final String srchVal;
//   final String crtnYr;
//   final String cntaFlag;
//   final String inactivFlag;
//   final String? pgNo;
//   final String? pgSz;

//   QueryRequest({
//     required this.doctyp,
//     required this.scrNo,
//     required this.untNo,
//     required this.sysNo,
//     required this.sysTyp,
//     required this.srchVal,
//     required this.crtnYr,
//     required this.cntaFlag,
//     required this.inactivFlag,
//     this.pgNo,
//     this.pgSz,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       "doctyp": doctyp,
//       "scrNo": scrNo,
//       "untNo": untNo,
//       "sysNo": sysNo,
//       "sysTyp": sysTyp,
//       "srchVal": srchVal,
//       "crtnYr": crtnYr,
//       "cntaFlag": cntaFlag,
//       "inactivFlag": inactivFlag,
//       "pgNo": pgNo,
//       "pgSz": pgSz,
//     };
//   }
// }

// // query_response.dart
// class QueryResponse {
//   final int status;
//   final String message;
//   final dynamic data; // Replace `dynamic` with a specific type if the response structure is known.

//   QueryResponse({
//     required this.status,
//     required this.message,
//     this.data,
//   });

//   factory QueryResponse.fromJson(Map<String, dynamic> json) {
//     return QueryResponse(
//       status: json['status'],
//       message: json['message'],
//       data: json['data'],
//     );
//   }
// }



