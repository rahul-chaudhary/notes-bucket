// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cached_daily_quote.dart';

class CachedDailyQuoteMapper extends ClassMapperBase<CachedDailyQuote> {
  CachedDailyQuoteMapper._();

  static CachedDailyQuoteMapper? _instance;
  static CachedDailyQuoteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CachedDailyQuoteMapper._());
      DailyQuoteMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CachedDailyQuote';

  static DailyQuote _$quote(CachedDailyQuote v) => v.quote;
  static const Field<CachedDailyQuote, DailyQuote> _f$quote = Field(
    'quote',
    _$quote,
  );
  static DateTime _$fetchedAt(CachedDailyQuote v) => v.fetchedAt;
  static const Field<CachedDailyQuote, DateTime> _f$fetchedAt = Field(
    'fetchedAt',
    _$fetchedAt,
  );

  @override
  final MappableFields<CachedDailyQuote> fields = const {
    #quote: _f$quote,
    #fetchedAt: _f$fetchedAt,
  };

  static CachedDailyQuote _instantiate(DecodingData data) {
    return CachedDailyQuote(
      quote: data.dec(_f$quote),
      fetchedAt: data.dec(_f$fetchedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CachedDailyQuote fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CachedDailyQuote>(map);
  }

  static CachedDailyQuote fromJson(String json) {
    return ensureInitialized().decodeJson<CachedDailyQuote>(json);
  }
}

mixin CachedDailyQuoteMappable {
  String toJson() {
    return CachedDailyQuoteMapper.ensureInitialized()
        .encodeJson<CachedDailyQuote>(this as CachedDailyQuote);
  }

  Map<String, dynamic> toMap() {
    return CachedDailyQuoteMapper.ensureInitialized()
        .encodeMap<CachedDailyQuote>(this as CachedDailyQuote);
  }

  CachedDailyQuoteCopyWith<CachedDailyQuote, CachedDailyQuote, CachedDailyQuote>
  get copyWith =>
      _CachedDailyQuoteCopyWithImpl<CachedDailyQuote, CachedDailyQuote>(
        this as CachedDailyQuote,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CachedDailyQuoteMapper.ensureInitialized().stringifyValue(
      this as CachedDailyQuote,
    );
  }

  @override
  bool operator ==(Object other) {
    return CachedDailyQuoteMapper.ensureInitialized().equalsValue(
      this as CachedDailyQuote,
      other,
    );
  }

  @override
  int get hashCode {
    return CachedDailyQuoteMapper.ensureInitialized().hashValue(
      this as CachedDailyQuote,
    );
  }
}

extension CachedDailyQuoteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CachedDailyQuote, $Out> {
  CachedDailyQuoteCopyWith<$R, CachedDailyQuote, $Out>
  get $asCachedDailyQuote =>
      $base.as((v, t, t2) => _CachedDailyQuoteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CachedDailyQuoteCopyWith<$R, $In extends CachedDailyQuote, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  DailyQuoteCopyWith<$R, DailyQuote, DailyQuote> get quote;
  $R call({DailyQuote? quote, DateTime? fetchedAt});
  CachedDailyQuoteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CachedDailyQuoteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CachedDailyQuote, $Out>
    implements CachedDailyQuoteCopyWith<$R, CachedDailyQuote, $Out> {
  _CachedDailyQuoteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CachedDailyQuote> $mapper =
      CachedDailyQuoteMapper.ensureInitialized();
  @override
  DailyQuoteCopyWith<$R, DailyQuote, DailyQuote> get quote =>
      $value.quote.copyWith.$chain((v) => call(quote: v));
  @override
  $R call({DailyQuote? quote, DateTime? fetchedAt}) => $apply(
    FieldCopyWithData({
      if (quote != null) #quote: quote,
      if (fetchedAt != null) #fetchedAt: fetchedAt,
    }),
  );
  @override
  CachedDailyQuote $make(CopyWithData data) => CachedDailyQuote(
    quote: data.get(#quote, or: $value.quote),
    fetchedAt: data.get(#fetchedAt, or: $value.fetchedAt),
  );

  @override
  CachedDailyQuoteCopyWith<$R2, CachedDailyQuote, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CachedDailyQuoteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

