// [
// {
// "q": "A man who dares to waste one hour of time has not discovered the value of life.",
// "a": "Charles Darwin",
// "h": "<blockquote>&ldquo;A man who dares to waste one hour of time has not discovered the value of life.&rdquo; &mdash; <footer>Charles Darwin</footer></blockquote>"
// }
// ]

import 'package:dart_mappable/dart_mappable.dart';

part 'daily_quote.mapper.dart';

@MappableClass()
class DailyQuote with DailyQuoteMappable {
  @MappableField(key: 'q')
  final String? quote;
  @MappableField(key: 'a')
  final String? author;

  const DailyQuote({this.quote, this.author});
}
