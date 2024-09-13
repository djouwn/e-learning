import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/list_users.dart';

class UserListPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final ScrollController _scrollController = ScrollController();

  UserListPage({super.key}) {
    userController.fetchUsers();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      userController.fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      shrinkWrap: true,
            itemCount: userController.users.length + 1,
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index < userController.users.length) {
                final user = userController.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Container(
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: const Center(child: Text("Delete",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20.0),),),
                  ),
                
                   onTap: () => userController.deleteUser(user.email),
                );
              } else {
                if (!userController.isLoading) {
                  return Container(); 
                } else {
                  return const Center(
                    child: CircularProgressIndicator(), 
                  );
                }
              }
            },
          ));
    
  }
}
