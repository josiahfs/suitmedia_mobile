// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:suitmedia_mobile/view/third_page.dart';

// class SecondPage extends StatelessWidget {
//   SecondPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var data = Get.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Screen',
//             style: GoogleFonts.poppins(
//                 color: const Color(0xff04021D),
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600)),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Welcome',
//                     style: GoogleFonts.poppins(
//                         color: const Color(0xff04021D),
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   Text(
//                     // 'John Doe',
//                     data[0],
//                     style: GoogleFonts.poppins(
//                         color: const Color(0xff04021D),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               Center(
//                 child: Text(
//                   data[1] == null || data[2] == null
//                       ? 'Selected User Name'
//                       : '${data[1]} ${data[2]}',
//                   style: GoogleFonts.poppins(
//                       color: const Color(0xff04021D),
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () => (print(data)),
//                 child: Text('cek data'),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: ElevatedButton(
//                   // onPressed: () {
//                   //   Get.to(ThirdPage(), arguments: data);
//                   // },
//                   onPressed: () async {
//                     var result = await Get.to<List<dynamic>>(
//                       ThirdPage(),
//                       arguments: data,
//                     );
//                     if (result != null) {
//                       var updatedData = result[0];
//                       var firstName = result[1];
//                       var lastName = result[2];
//                       var email = result[3];
//                       var avatar = result[4];
//                     }
//                   },
//                   style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Color(0xff2B637B)),
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     minimumSize: MaterialStateProperty.all(
//                         const Size(double.infinity, 40)),
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12.0),
//                     child: Text(
//                       'Choose a User',
//                       style: GoogleFonts.poppins(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_mobile/controller/selected_user_controller.dart';
import 'package:suitmedia_mobile/view/third_page.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: GoogleFonts.poppins(
            color: const Color(0xff04021D),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: GetBuilder<SelectedUserController>(
            init: SelectedUserController(), // Initialize the controller
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff04021D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        data,
                        style: GoogleFonts.poppins(
                          color: const Color(0xff04021D),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      controller.selectedUserName ?? 'Selected User Name',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff04021D),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        var result = await Get.to<List<dynamic>>(
                          ThirdPage(),
                          arguments: data,
                        );
                        if (result != null) {
                          controller.updateSelectedUserName(
                              result[1], result[2]);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff2B637B)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 40),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Choose a User',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
