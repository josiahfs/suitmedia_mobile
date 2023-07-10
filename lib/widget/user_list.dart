// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserList extends StatelessWidget {
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;

  UserList({super.key, this.firstName, this.lastName, this.email, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      // bottom border
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE2E3E4),
            width: 1.0,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 18),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 49.0,
            height: 49.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(avatar.toString()),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$firstName $lastName',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff04021D)),
              ),
              Text(
                email.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff686777)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
