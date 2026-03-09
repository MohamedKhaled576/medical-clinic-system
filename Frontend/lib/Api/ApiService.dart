import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Patient.dart';
import '../Models/User.dart';

class ApiService {
  final String baseUrl = 'http://localhost:6060'; // Replace with your actual base URL

  // ==================== USERS ====================
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((json) =>
          User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }

  Future<int> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    return response.statusCode;
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }

  // ==================== Patients ====================
  Future<List<Patient>> fetchPatients() async {
    final response = await http.get(Uri.parse('$baseUrl/patients'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((json) =>
          Patient.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load patients: ${response.statusCode}');
    }
  }

  Future<int> createPatient(Patient patient) async {
    final response = await http.post(
      Uri.parse('$baseUrl/patients'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(patient.toJson()),
    );
    return response.statusCode;
  }

  Future<void> deletePatient(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/patients/$id'));
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete patient');
    }
  }
}