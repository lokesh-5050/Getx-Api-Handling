import 'package:get/get.dart';
import 'package:prac2/models/Users.dart';
import 'package:prac2/services/api.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CallController extends GetxController {
  File? imgFile;
  final listOfFiles = <String>[].obs;
  final userss = <UserModel>[].obs;
  final _imgPicker = ImagePicker();

  Future<void> pickImg() async {
    final pickedImg = await _imgPicker.pickImage(source: ImageSource.gallery);
    if (pickedImg != null) {
      imgFile = File(pickedImg.path);
      listOfFiles.add(imgFile.toString());
      print("img added to imgFile => is $imgFile");
    } else {
      print("not selected the file");
    }
  }

  Future<void> uploadImg() async {
    Stream<List<int>> stream = http.ByteStream(imgFile!.openRead());
    stream.cast();
    int lenght = await imgFile!.length();

    Uri uri = Uri.parse('http://localhost:4040/');

    var request = http.MultipartRequest('POST', uri);

    request.fields['title'] = "string";

    var multiPart = http.MultipartFile('field of img in api', stream, lenght);

    request.files.add(multiPart);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("print image successfully");
    }

    // request.
  }

  ApiServices apiServices = ApiServices();

  Future<void> manageApiCall() async {
    List<UserModel> users = await apiServices.userApi();
    print("data is => $users");
    userss.value = users;
  }
}
