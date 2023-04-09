import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:prac2/models/Users.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prac2/helpers/exceptions.dart';

Future<List<dynamic>?> handleRequest(String type, String url, Dio dio) async {
  try {
    late Response response;

    switch (type) {
      case "GET":
        try {
          response = await dio.get(url);
          break;
        } on DioError catch (err) {
          await Fluttertoast.showToast(
              msg: err.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
        } catch (e) {
          Fluttertoast.showToast(
              msg: e.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
        }

      case "POST":
        response = await dio.post(url,
            options: Options(
              headers: {"": ""},
            ));
        break;
      default:
    }

    var result = await hanldeApiErrorsAndExcep(response);
    print("result in handleReq => $result");
    return result;
  } catch (e) {
    await Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
