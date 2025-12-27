import 'package:equatable/equatable.dart';

class OnboardSlideItem extends Equatable{
  final String animationPath;
  final String title;
  final String subtitle;

  const OnboardSlideItem({
    required this.animationPath,
    required this.title,
    required this.subtitle,
  });

  @override
  List<Object?> get props => [animationPath, title, subtitle];
}