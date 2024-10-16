part of 'news_bloc.dart';

class NewsState extends Equatable {
  final ApiStatus? apiStatus;
  final String? message;
  final List<NewsModel>? newsList;

  const NewsState({this.apiStatus, this.message, this.newsList});

  NewsState copyWith(
      {ApiStatus? apiStatus, String? message, List<NewsModel>? newsList}) {
    return NewsState(
        apiStatus: apiStatus ?? this.apiStatus,
        message: message ?? this.message,
        newsList: newsList ?? this.newsList);
  }

  @override
  List<Object?> get props => [apiStatus, message, newsList];
}
