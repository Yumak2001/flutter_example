// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/data/network/client.dart' as _i3;
import '../../core/data/network/service/auth.dart' as _i5;
import '../../core/data/network/service/events.dart' as _i10;
import '../../core/data/network/service/news.dart' as _i12;
import '../../core/data/network/service/profile.dart' as _i14;
import '../../core/data/network/service/ticket.dart' as _i19;
import '../../core/data/repository/auth.dart' as _i23;
import '../../core/data/repository/errors.dart' as _i8;
import '../../core/data/repository/events.dart' as _i26;
import '../../core/data/repository/news.dart' as _i31;
import '../../core/data/repository/profile.dart' as _i33;
import '../../core/data/repository/ticket.dart' as _i37;
import '../../core/data/storage/events.dart' as _i9;
import '../../core/data/storage/tickets.dart' as _i20;
import '../../core/data/storage/user.dart' as _i21;
import '../../core/domain/entities/events.dart' as _i42;
import '../../core/domain/repository/auth.dart' as _i22;
import '../../core/domain/repository/errors.dart' as _i7;
import '../../core/domain/repository/events.dart' as _i25;
import '../../core/domain/repository/news.dart' as _i30;
import '../../core/domain/repository/profile.dart' as _i32;
import '../../core/domain/repository/ticket.dart' as _i36;
import '../../core/presentation/error/cubit/cubit.dart' as _i24;
import '../../core/presentation/router/bloc/cubit.dart' as _i16;
import '../../core/presentation/screens/auth/bloc/bloc.dart' as _i39;
import '../../core/presentation/screens/buy_ticket_exposition/cubit.dart'
    as _i40;
import '../../core/presentation/screens/contacts/cubit.dart' as _i6;
import '../../core/presentation/screens/event_detail/cubit/cubit.dart' as _i41;
import '../../core/presentation/screens/exposition/cubit/cubit.dart' as _i27;
import '../../core/presentation/screens/first/bloc/bloc.dart' as _i28;
import '../../core/presentation/screens/home/bloc/cubit.dart' as _i43;
import '../../core/presentation/screens/image_picker/cubit/cubit.dart' as _i44;
import '../../core/presentation/screens/laboratory/cubit/cubit.dart' as _i45;
import '../../core/presentation/screens/main/bloc/bloc.dart' as _i29;
import '../../core/presentation/screens/news_detailed/cubit.dart' as _i46;
import '../../core/presentation/screens/news_list/cubit.dart' as _i47;
import '../../core/presentation/screens/profile/cubit/cubit.dart' as _i48;
import '../../core/presentation/screens/question_answer/cubit.dart' as _i15;
import '../../core/presentation/screens/setting_profile/cubit/cubit.dart'
    as _i34;
import '../../core/presentation/screens/splash_on_boarding/cubit.dart' as _i35;
import '../../core/presentation/screens/tickets/cubit/cubit.dart' as _i38;
import '../controller/app_bar_menu.dart' as _i4;
import '../controller/focus_text_field.dart' as _i11;
import '../controller/scrolls.dart' as _i17;
import '../controller/text_field_controllers.dart' as _i18;
import '../providers/perfomance.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.Api>(() => _i3.ApiImpl());
  gh.factory<_i4.AppBarMenuShowController>(
      () => _i4.AppBarMenuShowController());
  gh.factory<_i5.AuthService>(() => _i5.AuthServiceImpl(get<_i3.Api>()));
  gh.factory<_i6.ContactsCubit>(() => _i6.ContactsCubit());
  gh.lazySingleton<_i7.ErrorsRepository>(() => _i8.ErrorsRepositoryImpl());
  gh.factory<_i9.EventsDataStorage>(() => _i9.EventsDataStorageHive());
  gh.factory<_i10.EventsService>(() => _i10.EventsServiceImpl(get<_i3.Api>()));
  gh.factory<_i11.FocusTextFieldProvider>(() => _i11.FocusTextFieldProvider());
  gh.factory<_i12.NewsService>(() => _i12.NewsServiceImpl(get<_i3.Api>()));
  gh.factory<_i13.PerformanceProvider>(() => _i13.PerformanceProvider());
  gh.factory<_i14.ProfileService>(
      () => _i14.ProfileServiceImpl(get<_i3.Api>()));
  gh.factory<_i15.QuestionAnswerCubit>(() => _i15.QuestionAnswerCubit());
  gh.singleton<_i16.RouterEventSink>(_i16.RouterCubit());
  gh.factory<_i17.ScrollProvider>(() => _i17.ScrollProvider());
  gh.factory<_i18.TextFieldControllers>(() => _i18.TextFieldControllers());
  gh.factory<_i19.TicketService>(() => _i19.TicketServiceImpl(get<_i3.Api>()));
  gh.factory<_i20.TicketsDataStorage>(() => _i20.TicketsDataStorageHive());
  gh.factory<_i21.UserDataStorage>(() => _i21.AuthStorageHive());
  gh.lazySingleton<_i22.AuthRepository>(() => _i23.AuthRepositoryImpl(
      get<_i5.AuthService>(),
      get<_i21.UserDataStorage>(),
      get<_i9.EventsDataStorage>(),
      get<_i20.TicketsDataStorage>()));
  gh.factory<_i24.ErrorCubit>(
      () => _i24.ErrorCubit(get<_i7.ErrorsRepository>()));
  gh.lazySingleton<_i25.EventsRepository>(() => _i26.EventsRepositoryImpl(
      get<_i10.EventsService>(), get<_i9.EventsDataStorage>()));
  gh.factory<_i27.ExpositionCubit>(
      () => _i27.ExpositionCubit(get<_i16.RouterEventSink>()));
  gh.factory<_i28.FirstBloc>(() => _i28.FirstBloc(get<_i16.RouterEventSink>()));
  gh.factory<_i29.MainBloc>(() => _i29.MainBloc(get<_i16.RouterEventSink>()));
  gh.lazySingleton<_i30.NewsRepository>(
      () => _i31.NewsRepositoryImpl(get<_i12.NewsService>()));
  gh.lazySingleton<_i32.ProfileRepository>(() => _i33.ProfileRepositoryImpl(
      get<_i14.ProfileService>(),
      get<_i21.UserDataStorage>(),
      get<_i9.EventsDataStorage>(),
      get<_i20.TicketsDataStorage>()));
  gh.factory<_i34.SettingProfileCubit>(
      () => _i34.SettingProfileCubit(get<_i32.ProfileRepository>()));
  gh.factory<_i35.SplashOnBoardingCubit>(() => _i35.SplashOnBoardingCubit(
      get<_i16.RouterEventSink>(), get<_i21.UserDataStorage>()));
  gh.lazySingleton<_i36.TicketRepository>(
      () => _i37.TicketRepositoryImpl(get<_i19.TicketService>()));
  gh.factory<_i38.TicketsCubit>(
      () => _i38.TicketsCubit(get<_i32.ProfileRepository>()));
  gh.factoryParam<_i39.AuthBloc, bool, Function>((editPass, callback) =>
      _i39.AuthBloc(editPass, callback, get<_i22.AuthRepository>()));
  gh.factory<_i40.BuyTicketExpositionCubit>(
      () => _i40.BuyTicketExpositionCubit(get<_i36.TicketRepository>()));
  gh.factoryParam<_i41.EventDetailCubit, _i42.EventDomain?, dynamic>(
      (event, _) => _i41.EventDetailCubit(event, get<_i16.RouterEventSink>(),
          get<_i25.EventsRepository>(), get<_i32.ProfileRepository>()));
  gh.factory<_i43.HomeCubit>(() => _i43.HomeCubit(get<_i16.RouterEventSink>(),
      get<_i22.AuthRepository>(), get<_i32.ProfileRepository>()));
  gh.factory<_i44.ImagePickerCubit>(
      () => _i44.ImagePickerCubit(get<_i32.ProfileRepository>()));
  gh.factory<_i45.LaboratoryCubit>(() => _i45.LaboratoryCubit(
      get<_i16.RouterEventSink>(),
      get<_i25.EventsRepository>(),
      get<_i32.ProfileRepository>()));
  gh.factoryParam<_i46.NewsCubit, int, dynamic>(
      (id, _) => _i46.NewsCubit(id, get<_i30.NewsRepository>()));
  gh.factory<_i47.NewsListCubit>(
      () => _i47.NewsListCubit(get<_i30.NewsRepository>()));
  gh.factory<_i48.ProfileCubit>(() => _i48.ProfileCubit(
      get<_i16.RouterEventSink>(),
      get<_i22.AuthRepository>(),
      get<_i32.ProfileRepository>()));
  return get;
}
