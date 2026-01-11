import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';

abstract interface class DailyQuoteRepository  {
  Future<Either<Failure, DailyQuote>> fetchDailyQuote();
}