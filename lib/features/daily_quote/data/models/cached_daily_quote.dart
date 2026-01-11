import 'package:dart_mappable/dart_mappable.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';

part 'cached_daily_quote.mapper.dart';

@MappableClass()
class CachedDailyQuote with CachedDailyQuoteMappable {
  final DailyQuote quote;
  final DateTime fetchedAt;

  CachedDailyQuote({
    required this.quote,
    required this.fetchedAt,
  });
}
