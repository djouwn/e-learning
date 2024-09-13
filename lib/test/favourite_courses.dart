import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/show_favourite.dart';

class FavouriteCoursesPage extends StatelessWidget {
  final ShowFavouriteController favouriteController =
      Get.put(ShowFavouriteController());

  FavouriteCoursesPage({super.key, }) {
    favouriteController.fetchFavoriteCourses();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        
        body: 
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             const Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "Favourite Courses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "Browse your courses",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<ShowFavouriteController>(
              builder: (ShowFavouriteController controller) {
                return
                 ListView.builder(
                  shrinkWrap: true,
                  itemCount: favouriteController.favoriteCourses.length,
                  itemBuilder: (context, index) {
                    final course = favouriteController.favoriteCourses[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      title: Text(
                        course[2],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                      leading: Image.network(course[5]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course[3],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            course[4],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
