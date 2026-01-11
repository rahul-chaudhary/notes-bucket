import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/features/daily_quote/data/models/cached_daily_quote.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';

abstract interface class DailyQuoteLocalDatasource {
  Future<DailyQuote?> getTodayQuote();
  Future<void> saveTodayQuote(CachedDailyQuote quote);
}
class DailyQuoteLocalDatasourceImpl
    implements DailyQuoteLocalDatasource {

  final FlutterSecureStorage secureStorage;

  DailyQuoteLocalDatasourceImpl(this.secureStorage);


  @override
  Future<DailyQuote?> getTodayQuote() async {
    final savedCachedJson = await secureStorage.read(key: SecureStorageKeys.cachedQuoteKey);
    if (savedCachedJson == null) return null;

    final cachedQuote = CachedDailyQuoteMapper.fromJson(savedCachedJson);
    final cachedDate = cachedQuote.fetchedAt;
    final now = DateTime.now();

    final isSameDay =
        cachedDate.year == now.year &&
            cachedDate.month == now.month &&
            cachedDate.day == now.day;

    if (!isSameDay) return null;

    return cachedQuote.quote;
  }

  @override
  Future<void> saveTodayQuote(CachedDailyQuote quote) async {
    await secureStorage.write(key: SecureStorageKeys.cachedQuoteKey, value: quote.toJson());
  }
}
