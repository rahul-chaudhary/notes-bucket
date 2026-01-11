import 'package:notes_bucket/core/network/providers/network_providers.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/features/daily_quote/data/datasources/daily_quote_remote_datasource.dart';
import 'package:notes_bucket/features/daily_quote/data/datasources/daily_quotes_local_datasource.dart';
import 'package:notes_bucket/features/daily_quote/data/models/daily_quote.dart';
import 'package:notes_bucket/features/daily_quote/data/repositories/daily_quote_repository_impl.dart';
import 'package:notes_bucket/features/daily_quote/domain/repositories/daily_quotes_repository.dart';
import 'package:notes_bucket/features/daily_quote/domain/usecases/daily_quotes_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'daily_quote_provider.g.dart';

// ─────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS (Datasource + Repository)
// ─────────────────────────────────────────────────────────────

@riverpod
DailyQuoteLocalDatasource dailyQuoteLocalDatasource(Ref ref)  {
  final secureStorage = ref.watch(secureStorageProvider);
  return DailyQuoteLocalDatasourceImpl(secureStorage);
}

@riverpod
Future<DailyQuoteRemoteDatasource> dailyQuoteRemoteDatasource(Ref ref) async {
  final apiClient = await ref.watch(apiClientProvider.future);
  return DailyQuoteRemoteDatasourceImpl(apiClient);
}

@riverpod
Future<DailyQuoteRepository> dailyQuoteRepository(Ref ref) async {
  final local = ref.watch(dailyQuoteLocalDatasourceProvider);
  final remote = await ref.watch(dailyQuoteRemoteDatasourceProvider.future);
  return DailyQuoteRepositoryImpl(remote, local);
}

// ─────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (Use-Cases)
// ─────────────────────────────────────────────────────────────

@riverpod
Future<FetchDailyQuote> fetchDailyQuoteUseCase(Ref ref) async {
  final repository = await ref.watch(dailyQuoteRepositoryProvider.future);
  return FetchDailyQuote(repository);
}

// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

@riverpod
class DailyQuoteNotifier extends _$DailyQuoteNotifier {

  @override
  Future<DailyQuote> build() async {
    final usecase =
    await ref.read(fetchDailyQuoteUseCaseProvider.future);

    final result = await usecase.call(null);

    return result.fold(
          (failure) => throw failure.message,
          (quote) => quote,
    );
  }
}

