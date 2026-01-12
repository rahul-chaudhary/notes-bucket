import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';

abstract interface class DailyQuoteRemoteDatasource {
  Future<DailyQuote> fetchDailyQuote();
}

class DailyQuoteRemoteDatasourceImpl implements DailyQuoteRemoteDatasource {
  final ApiClient _apiClient;

  DailyQuoteRemoteDatasourceImpl(this._apiClient);

  @override
  Future<DailyQuote> fetchDailyQuote() async {
    try{
      final response = await _apiClient.get(ApiEndpoints.zenQuotes);
      final List<dynamic> jsonList = response.data;
      final List<DailyQuote> quotes = jsonList
          .map((json) => DailyQuoteMapper.fromMap(json as Map<String, dynamic>))
          .toList();
      return quotes.first;
    } catch (e) {
      rethrow;
    }
  }
}
