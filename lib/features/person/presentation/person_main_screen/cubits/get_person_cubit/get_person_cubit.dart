import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikandmorty/features/person/data/models/person_model.dart';
import 'package:rikandmorty/features/person/domain/use_cases/get_person_use_case.dart';
import 'package:rikandmorty/server/catch_exception.dart';

part 'get_person_state.dart';
part 'get_person_cubit.freezed.dart';

class GetPersonCubit extends Cubit<GetPersonState> {
  GetPersonCubit({required this.useCase})
      : super(const GetPersonState.loading()) {
    getPerson();
  }

  late ScrollController scrollController =
      ScrollController(initialScrollOffset: 0)..addListener(_scrollListener);

  final GetPersonUseCase useCase;
  String name = '';
  String gender = '';
  String status = '';
  String species = '';
  String type = '';
  int currantPage = 1;
  int allPages = 0;

  String get selectedGender => gender;
  String get selectedStatus => status;

  Future<void> getPerson(
      {String? nameFrom, String? statusFrom, String? genderFrom}) async {
    if (nameFrom != null) {
      name = nameFrom;
    }
    if (statusFrom != null) {
      status = statusFrom;
    }
    if (genderFrom != null) {
      gender = genderFrom;
    }
    // emit(const GetPersonState.loading());
    try {
      final result = await useCase.getPerson(
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        currantPage: currantPage,
      );
      emit(
        GetPersonState.success(result),
      );
    } catch (e) {
      emit(GetPersonState.error(CatchException.convertException(e)));
    }
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (allPages != currantPage) {
        currantPage = currantPage += 1;
        getPerson();
      }
    }
  }
}
