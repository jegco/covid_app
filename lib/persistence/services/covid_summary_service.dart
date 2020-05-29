import 'dart:convert';

import 'package:covidapp/domain/models/models.dart';
import 'package:dio/dio.dart';

class CovidSummaryService {
  final Dio _client;

  CovidSummaryService(this._client);

  Future<CovidSummary> getCovidSummary(String countryName) async {
    var response = await _client.get('summary');
    return CovidSummary.fromJson(response.data);
  }
}
