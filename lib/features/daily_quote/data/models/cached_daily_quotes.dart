import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';

class CachedDailyQuote {
  final DailyQuote quote;
  final DateTime fetchedAt;

  CachedDailyQuote({
    required this.quote,
    required this.fetchedAt,
  });
}
