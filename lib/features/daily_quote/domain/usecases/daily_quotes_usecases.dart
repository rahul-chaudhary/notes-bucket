import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';
import 'package:notes_bucket/features/daily_quote/domain/repositories/daily_quotes_repository.dart';

class FetchDailyQuote implements UseCase<DailyQuote, void> {
  final DailyQuoteRepository repository;

  FetchDailyQuote(this.repository);

  @override
  Future<Either<Failure, DailyQuote>> call(void params) {
    return repository.fetchDailyQuote();
  }

}