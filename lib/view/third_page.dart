import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_mobile/controller/pagination_controller.dart';
import 'package:suitmedia_mobile/model/user_repository.dart';
import 'package:suitmedia_mobile/widget/user_list.dart';

class ThirdPage extends StatelessWidget {
  final PaginationController paginationController =
      Get.put(PaginationController(UserRepository(Get.put(Dio()))));
  var data = Get.arguments;

  ThirdPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: GoogleFonts.poppins(
            color: const Color(0xff04021D),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            paginationController.refreshUsers();
          },
          child: Obx(() {
            final users = paginationController.users;

            if (users.isEmpty) {
              return const Center(
                child: Text('No data available.'),
              );
            }

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return GestureDetector(
                  onTap: () {
                    Get.back(result: [
                      data[0],
                      user.first_name,
                      user.last_name,
                      user.email,
                      user.avatar
                    ]);
                  },
                  child: UserList(
                    firstName: user.first_name,
                    lastName: user.last_name,
                    email: user.email,
                    avatar: user.avatar,
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
