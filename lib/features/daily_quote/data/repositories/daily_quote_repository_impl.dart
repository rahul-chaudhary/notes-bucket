import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/daily_quote/data/datasources/daily_quotes_local_datasource.dart';
import 'package:notes_bucket/features/daily_quote/data/datasources/daily_quote_remote_datasource.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';
import 'package:notes_bucket/features/daily_quote/domain/repositories/daily_quotes_repository.dart';

class DailyQuoteRepositoryImpl implements DailyQuoteRepository {
  final DailyQuoteRemoteDatasource remote;
  final DailyQuoteLocalDatasource local;

  DailyQuoteRepositoryImpl(this.remote, this.local);

  @override
  Future<Either<Failure, DailyQuote>> fetchDailyQuote() async {
    try{
      final cached = await local.getTodayQuote();
      if (cached != null) {
        return Right(cached);
      }

      final fresh = await remote.fetchDailyQuote();
      await local.saveTodayQuote(fresh);
      return Right(fresh);
    } catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }
}
