import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rikandmorty/features/auth/presentation/auth_screen/cubits/register_cubit/register_cubit.dart';
import 'package:rikandmorty/features/bottom_navigator/presentation/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:rikandmorty/features/episode/data/repo_impls/get_episode_repo_impl.dart';
import 'package:rikandmorty/features/episode/domain/repoositories/get_respons_repo.dart';
import 'package:rikandmorty/features/episode/domain/use_cases/get_episode_use_cases.dart';
import 'package:rikandmorty/features/episode/presentation/episode_main_screen/cubits/cubit/get_episode_cubit.dart';
import 'package:rikandmorty/features/loaction/data/repo_impls/get_loaction_repo_impl.dart';
import 'package:rikandmorty/features/loaction/domain/presentation/get_loaction_repo.dart';
import 'package:rikandmorty/features/loaction/domain/use_cases/get_loaction_use_cases.dart';
import 'package:rikandmorty/features/loaction/presentation/location_main_screen/cubits/cubit/get_loactions_cubit.dart';
import 'package:rikandmorty/features/person/data/repo_impls/get_persons_repo_impl.dart';
import 'package:rikandmorty/features/person/domain/repoositories/get_persons_repo.dart';
import 'package:rikandmorty/features/person/domain/use_cases/get_person_use_case.dart';
import 'package:rikandmorty/features/person/presentation/person_filtr_screen/cubits/cubit/is_chekbool_cubit.dart';
import 'package:rikandmorty/features/person/presentation/person_main_screen/cubits/get_person_cubit/get_person_cubit.dart';
import 'package:rikandmorty/features/person/presentation/person_main_screen/cubits/is_list_grid_cubit/is_list_grid_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/edit_profile_screen/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/edit_profile_screen/cubits/file_image_cubit/file_image_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/cubits/change_theme_radio_cubit/change_theme_radio_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/cubits/get_shar_pref_cubit/get_shar_pref_cubit.dart';
import 'package:rikandmorty/features/splash/splash_cubit/splash_cubit.dart';
import 'package:rikandmorty/routes/mobile_auto_router.dart';
import 'package:rikandmorty/server/dio_settings.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

// ignore: long-method
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Other Services
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => DioSettings(prefs: sl()).dio);
  sl.registerSingleton<AppRouter>(AppRouter());

  /// Repository
  sl.registerFactory<GetPersonRepo>(() => GetPersonRepoImpl(dio: sl()));
  sl.registerFactory<GetLoactionRepo>(() => GetLoactionRepoImpl(dio: sl()));
  sl.registerFactory<GetEpisodeRepo>(() => GetEpisodeRepoImpl(dio: sl()));

  /// UseCases
  sl.registerFactory<GetPersonUseCase>(() => GetPersonUseCase(repo: sl()));
  sl.registerFactory<GetLoactionUseCase>(() => GetLoactionUseCase(repo: sl()));
  sl.registerFactory<GetEpisodeUseCase>(() => GetEpisodeUseCase(repo: sl()));
  
  /// BLoCs / Cubits
  sl.registerFactory<SplashCubit>(() => SplashCubit(prefs: sl()));
  sl.registerFactory<BottomNavigatorCubit>(() => BottomNavigatorCubit());
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(prefs: sl()));
  sl.registerFactory<EditProfileCubit>(() => EditProfileCubit(prefs: sl()));
  sl.registerFactory<GetPersonCubit>(() => GetPersonCubit(useCase: sl()));
  sl.registerFactory<IsListGridCubit>(() => IsListGridCubit());
  sl.registerFactory<ChangeThemeRadioCubit>(() => ChangeThemeRadioCubit());
  sl.registerFactory<ThemeProvider>(() => ThemeProvider());
  sl.registerFactory<GetLoactionsCubit>(() => GetLoactionsCubit(repo: sl()));
  sl.registerFactory<GetEpisodeCubit>(() => GetEpisodeCubit(repo: sl()));
  sl.registerFactory<FileImageCubit>(() => FileImageCubit(sl()));
  sl.registerFactory<GetSharPrefCubit>(() => GetSharPrefCubit(sl()));
  sl.registerFactory<IsChekboolCubit>(() => IsChekboolCubit());
}
