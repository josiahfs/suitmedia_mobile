import 'package:dio/dio.dart';
import 'package:suitmedia_mobile/model/pagination_filter.dart';
import 'package:suitmedia_mobile/model/user_model.dart';

class UserRepository {
  Dio _dio;

  UserRepository(
    this._dio,
  );

  // Future<List<UserModel>> getUsers(PaginationFilter filter) {
  //   return _dio.get('/users', queryParameters: {
  //     'page': filter.page,
  //     'limit': filter.limit
  //   }).then((value) => value?.data
  //       ?.map<UserModel>(
  //         (u) => UserModel.fromJson(u),
  //       )
  //       ?.toList());
  // }
  Future<List<UserModel>> getUsers(PaginationFilter filter) {
    final url =
        'https://reqres.in/api/users'; // Update with the complete API endpoint URL
    return _dio.get(url, queryParameters: {
      'page': filter.page,
      'per_page': filter.limit,
    }).then((response) {
      final data = response.data['data'] as List<dynamic>;
      final users =
          data.map<UserModel>((json) => UserModel.fromJson(json)).toList();
      return users;
    });
  }
}
