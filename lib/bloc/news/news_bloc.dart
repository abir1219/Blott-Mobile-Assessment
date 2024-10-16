import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/news_model.dart';
import '../../repository/news_repository.dart';
import '../../utils/enums.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  var newsRepository = NewsRepository();

  NewsBloc(this.newsRepository) : super(const NewsState()) {
    on<FetchNewsEvent>(_fetchNewsModel);
  }

  List<NewsModel> newsList = [];
  FutureOr<void> _fetchNewsModel(FetchNewsEvent event, Emitter<NewsState> emit) async{
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    //var newsModel = NewsModel();
    await newsRepository.fetchNews().then((value) {
      // newsModel = NewsModel.fromJson(value);
      newsList = (value as List).map((newsItem) => NewsModel.fromJson(newsItem)).toList();
      debugPrint("DATA--->$newsList");
      emit(state.copyWith(apiStatus: ApiStatus.success,newsList: newsList));
    },).onError((error, stackTrace) {
      emit(state.copyWith(apiStatus: ApiStatus.error,message: "Something went wrong. Please try again later."));
      debugPrint("ERROR-->$error");
    },);
  }
}
