import 'dart:convert';

import 'package:advice_generator/Data/Model/advice_model.dart';
import 'package:advice_generator/Domain/Entity/advice.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource({required this.client});

  Future<Advice> getRandomAdvice() async {
    final response = await client.get(
      Uri.parse('https://api.adviceslip.com/advice'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AdviceModel.fromJson(data);
    }

    throw Exception(
      'Failed to load random advice: Status ${response.statusCode}',
    );
  }
}
