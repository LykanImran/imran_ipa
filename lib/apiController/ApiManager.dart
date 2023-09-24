import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imran_ipa/common/alerts.dart';

class ApiManager {
  static bool showLog = true;

  // Post API
  Future<dynamic> callPostApi(
      BuildContext context, String webLink, Object params, String token) async {
    Dio dio = Dio();
    try {
      final Response response;
      if (token == '') {
        response = await dio.post(webLink,
            data: params,
            options: Options(headers: {'Content-Type': 'application/json'}));
      } else {
        response = await dio.post(webLink,
            data: params,
            options: Options(headers: {
              'Authorization': ' Bearer $token',
              //'Authorization': token,
              'Content-Type': 'application/json'
            }));
      }
      var data = response.data;
      debugPrint('data Response >>>>>> $data');

      if (showLog) {
        log('\n\n**************************URL**************************\n\n$webLink\n\n');
        log('\n\n**************************REQUESTS**************************\n\n${jsonEncode(params)}\n\n');
        log('\n\n**************************RESPONSE**************************\n\n$data\n\n');
      }
      return data;
    } on DioError catch (error) {
      debugPrint('DIO ERROR>>>> $error');
      // print(error);
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        log('Server is not reachable. Please verify your internet connection and try again');
        Alert().showAlertDialog(context, 'Server Unreachable',
            'Server is not reachable. Please verify your internet connection and try again');
      } else if (DioErrorType.response == error.type) {
        if (error.response!.statusCode == 404) {
          log('Url is not found or Page is missing. Please check Url.');
        } else if (error.response!.statusCode == 500) {
          log('Internal Sever Error');
          Alert().showAlertDialog(
              context, 'Server Unreachable', 'Internal Sever Error');
        } else if (error.message.contains('SocketException')) {
          log('Please check your internet connection and try again');
          Alert().showAlertDialog(context, 'Internet Unavailable',
              'Please check your internet connection and try again');
        }
      }
    }
  }

  Future<dynamic> callMultiPartApi(
      BuildContext context, String webLink, var params, String token,
      {Function(String)? onProgress}) async {
    Dio dio = Dio();
    try {
      print(138);
      final Response response;
      debugPrint("Token ---- > $token");
      dio.interceptors.add(LogInterceptor(request: true, responseBody: true));

      if (token == '') {
        response = await dio.post(webLink, data: FormData.fromMap(params));
      } else {
        response = await dio.post(webLink,
            data: FormData.fromMap(params),
            options: Options(headers: {
              'Authorization': ' Bearer $token',
              //'Authorization': token,
              // 'Content-Type': 'application/json'
            }), onSendProgress: (sent, total) {
          if (onProgress != null) {
            onProgress('${(sent / total * 100).toStringAsFixed(0)}%');
          }
        });
        debugPrint("after else $response");
      }
      var data = response.data;

      debugPrint("Response ---- > $response");
      if (showLog) {
        log('\n\n**************************URL**************************\n\n$webLink\n\n');
        // log("\n\n**************************REQUESTS**************************\n\n${jsonEncode(params)}\n\n");
        log('\n\n**************************RESPONSE**************************\n\n$data\n\n');
      }
      return data;
    } on DioError catch (error) {
      log(error.toString());
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        log('Server is not reachable. Please verify your internet connection and try again');
        Alert().showAlertDialog(context, 'Server Unreachable',
            'Server is not reachable. Please verify your internet connection and try again');
      } else if (DioErrorType.response == error.type) {
        if (error.response!.statusCode == 404) {
          log('Url is not found or Page is missing. Please check Url.');
        } else if (error.response!.statusCode == 500) {
          log('Internal Sever Error');
          Alert().showAlertDialog(
              context, 'Server Unreachable', 'Internal Sever Error');
        } else if (error.message.contains('SocketException')) {
          log('Please check your internet connection and try again');
          Alert().showAlertDialog(context, 'Internet Unavailable',
              'Please check your internet connection and try again');
        }
      }
    }
  }
}
