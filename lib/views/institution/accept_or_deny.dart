
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/specialized_in.dart';

Widget buildPageThree() {
  return Stack(
    children: [
      Positioned(
        top: 20,
        left: 20,
        child: Text(
          "Join an institution",
          style: GoogleFonts.comicNeue(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        alignment: Alignment.topCenter, // Adjust alignment as needed
        padding: const EdgeInsets.only(top: 60,left: 20), // Adjust top padding as needed
        child: ListViewInstitution(),
      ),
    ],
  );
}


   


class YesOrNo extends StatefulWidget {
  const YesOrNo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _YesOrNoState createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {
  bool isYesSelected = false;
  bool isNoSelected = false;

  void selectYes() {
    setState(() {
      isYesSelected = true;
      isNoSelected = false;
    });
  }

  void selectNo() {
    setState(() {
      isYesSelected = false;
      isNoSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildOption2("Yes", isYesSelected, selectYes),
        
        buildOption2("No", isNoSelected, selectNo),
      ],
    );
  }

  Widget buildOption2(String option, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 150, 
      height: 50,
      child: PhysicalModel(
        color: isSelected ? AppColors.bluebutton : Colors.white,
        elevation: 8,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Text(
            option,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    ),
  );
}

}
class ListViewInstitution extends StatelessWidget {
  final YourController controller = Get.put(YourController());

   ListViewInstitution({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchInstitution(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return buildListView(controller.options);
        }
      },
    );
  }

  Widget buildListView(List<String> options) {
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        return 
        
        
        ListTile(
          title: Text(options[index]),
          // Implement onTap if needed
        );
      },
    );
  }
}