import 'package:get/get.dart';
import 'package:suitmedia_mobile/model/pagination_filter.dart';
import 'package:suitmedia_mobile/model/user_model.dart';
import 'package:suitmedia_mobile/model/user_repository.dart';

class PaginationController extends GetxController {
  final UserRepository _userRepository;
  final _users = <UserModel>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  PaginationController(this._userRepository);

  List<UserModel> get users => _users.toList();
  int? get limit => _paginationFilter.value.limit;
  int? get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  @override
  onInit() {
    ever(_paginationFilter, (_) => _getAllUsers());
    _changePaginationFilter(1, 15);
    super.onInit();
  }

  Future<void> _getAllUsers() async {
    final usersData = await _userRepository.getUsers(_paginationFilter.value);
    if (usersData.isEmpty) {
      _lastPage.value = true;
    }
    _users.addAll(usersData);
  }

  void changeTotalPerPage(int limitValue) {
    _users.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page! + 1, limit!);

  Future<void> refreshUsers() async {
    _users.clear();
    _lastPage.value = false;
    await _getAllUsers();
  }
}
