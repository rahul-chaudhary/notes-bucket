import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';

abstract interface class DailyQuoteLocalDatasource {
  Future<DailyQuote?> getTodayQuote();
  Future<void> saveTodayQuote(DailyQuote quote);
}
class DailyQuoteLocalDatasourceImpl
    implements DailyQuoteLocalDatasource {

  final FlutterSecureStorage secureStorage;

  DailyQuoteLocalDatasourceImpl(this.secureStorage);

  static const _quoteKey = 'daily_quote';
  static const _dateKey = 'daily_quote_date';

  @override
  Future<DailyQuote?> getTodayQuote() async {
    final savedDate = await secureStorage.read(key: _dateKey);
    if (savedDate == null) return null;

    final date = DateTime.parse(savedDate);
    final now = DateTime.now();

    final isSameDay =
        date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;

    if (!isSameDay) return null;

    final json = await secureStorage.read(key: _quoteKey);
    if (json == null) return null;

    return DailyQuoteMapper.fromJson(json);
  }

  @override
  Future<void> saveTodayQuote(DailyQuote quote) async {
    await secureStorage.write(key: _quoteKey, value: quote.toJson());
    await secureStorage.write(key: _dateKey, value: DateTime.now().toIso8601String());
  }
}
