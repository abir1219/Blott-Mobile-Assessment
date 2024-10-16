part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();
}

final class FetchNewsEvent extends NewsEvent{
  @override
  List<Object?> get props => [];

}
