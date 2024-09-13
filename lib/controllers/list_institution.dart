import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class FetchInstitutionsController extends GetxController {
  final box = GetStorage();
  RxList<dynamic> institutions = <dynamic>[].obs;
  int currentPage = 1;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchInstitutions(); // Fetch initial data
  }

  Future<void> fetchInstitutions() async {
    try {
      if (box.read('cachedInstitutions') != null && currentPage == 1) {
       
        institutions.addAll(box.read('cachedInstitutions'));
      }
      if (institutions.isEmpty) {
       
        isLoading = true;
      }

      String url = 'http://192.168.1.13:5000/institution?page=$currentPage&per_page=10';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> fetchedData = jsonDecode(response.body)['institutions'];
        institutions.addAll(fetchedData);
    
        if (currentPage == 1) {
         
          box.write('cachedInstitutions', institutions);
        }
        isLoading = false; 
      } else {
   
      }
    // ignore: empty_catches
    } catch (e) {
     
    }
  }
}
