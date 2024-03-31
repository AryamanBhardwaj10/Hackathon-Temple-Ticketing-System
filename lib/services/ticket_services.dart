// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pooja_pass/utils/constants.dart';
import 'package:pooja_pass/utils/utils.dart';
import 'package:http/http.dart' as http;

class TicketServices {
  //book ticket
  Future<void> bookTicket(
    BuildContext context,
    String emailId,
    String date,
    List<String> memberNames,
  ) async {
    try {
      final qrCodeString = generateQrCodeString(emailId, memberNames, date);
      final body = jsonEncode({
        'emailId': emailId,
        'date': date,
        'memberNames': memberNames,
        'qrCodeString': qrCodeString,
      });

      //todo: replace with real endpoint
      final response = await http.post(Uri.parse('${Constants.uri}/tickets'),
          body: body,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      //handle any error
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackbar(context, "Ticket booked successfully!");
          });
      //go back to main screen
      Navigator.pop(context);
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
  //retrieve all tickets

  //generating qr string
  String generateQrCodeString(
      String email, List<String> memberNames, String date) {
    // Combine email, member names (joined with comma), and date in a single string
    final combinedString = '$email,${memberNames.join(', ')}, $date';
    return combinedString;
  }
}
