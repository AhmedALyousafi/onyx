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
