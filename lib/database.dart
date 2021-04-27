import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final CollectionReference requests = FirebaseFirestore.instance.collection("requests");
  final CollectionReference visitors = FirebaseFirestore.instance.collection("visitors");

  Future sendRequest(String email, String subject, String message) async {

    var random = new Random();
    return await requests.doc(email + '${random.nextInt(500)}').set({
      "subject": subject,
      "message": message
    });
  }

  Future addVisitor() async{
    var ip = await getIP();
    var random = new Random();
    return await visitors.doc(ip + '(${random.nextInt(500)})').set({
      "time": DateTime.now()
    });
  }

  Future<String> getIP() async {
    try {
      var url = Uri.https('api.ipify.org', "");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        return 'nothing';
      }
    } catch (exception) {
      return 'nothing';
    }
  }
}