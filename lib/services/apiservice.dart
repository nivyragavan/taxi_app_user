import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../constants/apiconstants.dart';
import '../models/get_profile_model.dart';
import '../models/package_list_model.dart';

class APIService {
  final box = GetStorage();

  Future userRegister(String name, contact, email, password) async {
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.register;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri, body: {
      'name': name,
      'contact': contact,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      var convertedDataToJson = jsonDecode(response.body);
      print(convertedDataToJson);
      return convertedDataToJson;
    }
  }

  Future userLogin(String contact, password) async {
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.login;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri, body: {
      'contact' : contact,
      'password' : password
    });
    if(response.statusCode == 200){
      print(response.statusCode);
      var convertedDataFromJson = jsonDecode(response.body);
      print(convertedDataFromJson);
      return convertedDataFromJson;
    }
  }

  Future<GetProfileModel?> fetchProfile() async {
    var userId = box.read('userId');
    var params = {'userId': '$userId'};
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.profileView;
    var uri = Uri.parse(completeUrl);
    var newUri = uri.replace(queryParameters: params);
    print('========= uri = $uri ===========');
    print('=========new Uri = $newUri ==========');
    final response = await client.get(newUri);
    print('userId:$userId');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      GetProfileModel getProfileModel =
      GetProfileModel.fromJson(json.decode(response.body));
      print(getProfileModel.toJson());
      return getProfileModel;
    } else {
      return null;
    }
  }


  Future<PackageListModel?> packageAndCab() async {
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.packageList;
    var uri = Uri.parse(completeUrl);
    final response = await client.get(uri);
    if(response.statusCode == 200){
      print(response.body.toString());
      var json = response.body;
      return packageListModelFromJson(json);
    }
    return null;
  }
}

//
//   Future<GetAllTripListModel?> allTripList() async {
//     var userId = box.read('userId');
//     var params = {'userId': '$userId'};
//     var client = http.Client();
//     var completeUrl = APIConstants.baseUrl + APIConstants.getAllTripHistory;
//     var uri = Uri.parse(completeUrl);
//     var newUri = uri.replace(queryParameters: params);
//     print('========= uri = $uri ===========');
//     print('=========new Uri = $newUri ==========');
//     final response = await client.get(newUri);
//     print('userId:$userId');
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       GetAllTripListModel getAllTripListModel =
//           GetAllTripListModel.fromJson(json.decode(response.body));
//       print(getAllTripListModel.toJson());
//       return getAllTripListModel;
//     } else {
//       return null;
//     }
//   }
//
//   Future<GetCompletedListModel?> completedList() async {
//     var userId = box.read('userId');
//     var params = {'userId': '$userId'};
//     var client = http.Client();
//     var completeUrl = APIConstants.baseUrl + APIConstants.getCompletedHistory;
//     var uri = Uri.parse(completeUrl);
//     var newUri = uri.replace(queryParameters: params);
//     print('========= uri = $uri ===========');
//     print('=========new Uri = $newUri ==========');
//     final response = await client.get(newUri);
//     print('userId:$userId');
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       GetCompletedListModel getCompletedListModel =
//           GetCompletedListModel.fromJson(json.decode(response.body));
//       print(getCompletedListModel.toJson());
//       return getCompletedListModel;
//     } else {
//       return null;
//     }
//   }
//
//   Future<GetUpcomingListModel?> upcomingList() async {
//     var userId = box.read('userId');
//     var params = {'userId': '$userId'};
//     var client = http.Client();
//     var completeUrl = APIConstants.baseUrl + APIConstants.getUpcomingHistory;
//     var uri = Uri.parse(completeUrl);
//     var newUri = uri.replace(queryParameters: params);
//     print('========= uri = $uri ===========');
//     print('=========new Uri = $newUri ==========');
//     final response = await client.get(newUri);
//     print('userId:$userId');
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       GetUpcomingListModel getUpcomingListModel =
//           GetUpcomingListModel.fromJson(json.decode(response.body));
//       print(getUpcomingListModel.toJson());
//       return getUpcomingListModel;
//     } else {
//       return null;
//     }
//   }
// }
