// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'daily_quote.dart';

class DailyQuoteMapper extends ClassMapperBase<DailyQuote> {
  DailyQuoteMapper._();

  static DailyQuoteMapper? _instance;
  static DailyQuoteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DailyQuoteMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DailyQuote';

  static String? _$quote(DailyQuote v) => v.quote;
  static const Field<DailyQuote, String> _f$quote = Field(
    'quote',
    _$quote,
    key: r'q',
    opt: true,
  );
  static String? _$author(DailyQuote v) => v.author;
  static const Field<DailyQuote, String> _f$author = Field(
    'author',
    _$author,
    key: r'a',
    opt: true,
  );

  @override
  final MappableFields<DailyQuote> fields = const {
    #quote: _f$quote,
    #author: _f$author,
  };

  static DailyQuote _instantiate(DecodingData data) {
    return DailyQuote(quote: data.dec(_f$quote), author: data.dec(_f$author));
  }

  @override
  final Function instantiate = _instantiate;

  static DailyQuote fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DailyQuote>(map);
  }

  static DailyQuote fromJson(String json) {
    return ensureInitialized().decodeJson<DailyQuote>(json);
  }
}

mixin DailyQuoteMappable {
  String toJson() {
    return DailyQuoteMapper.ensureInitialized().encodeJson<DailyQuote>(
      this as DailyQuote,
    );
  }

  Map<String, dynamic> toMap() {
    return DailyQuoteMapper.ensureInitialized().encodeMap<DailyQuote>(
      this as DailyQuote,
    );
  }

  DailyQuoteCopyWith<DailyQuote, DailyQuote, DailyQuote> get copyWith =>
      _DailyQuoteCopyWithImpl<DailyQuote, DailyQuote>(
        this as DailyQuote,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DailyQuoteMapper.ensureInitialized().stringifyValue(
      this as DailyQuote,
    );
  }

  @override
  bool operator ==(Object other) {
    return DailyQuoteMapper.ensureInitialized().equalsValue(
      this as DailyQuote,
      other,
    );
  }

  @override
  int get hashCode {
    return DailyQuoteMapper.ensureInitialized().hashValue(this as DailyQuote);
  }
}

extension DailyQuoteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DailyQuote, $Out> {
  DailyQuoteCopyWith<$R, DailyQuote, $Out> get $asDailyQuote =>
      $base.as((v, t, t2) => _DailyQuoteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DailyQuoteCopyWith<$R, $In extends DailyQuote, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? quote, String? author});
  DailyQuoteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DailyQuoteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DailyQuote, $Out>
    implements DailyQuoteCopyWith<$R, DailyQuote, $Out> {
  _DailyQuoteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DailyQuote> $mapper =
      DailyQuoteMapper.ensureInitialized();
  @override
  $R call({Object? quote = $none, Object? author = $none}) => $apply(
    FieldCopyWithData({
      if (quote != $none) #quote: quote,
      if (author != $none) #author: author,
    }),
  );
  @override
  DailyQuote $make(CopyWithData data) => DailyQuote(
    quote: data.get(#quote, or: $value.quote),
    author: data.get(#author, or: $value.author),
  );

  @override
  DailyQuoteCopyWith<$R2, DailyQuote, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DailyQuoteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

