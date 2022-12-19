import 'package:faneron_mobile/src/common/controller/app_bar_menu.dart';
import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/common/controller/text_field_controllers.dart';
import 'package:faneron_mobile/src/common/injection/injection.dart';
import 'package:faneron_mobile/src/common/providers/perfomance.dart';
import 'package:faneron_mobile/src/core/data/storage/events.dart';
import 'package:faneron_mobile/src/core/data/storage/tickets.dart';
import 'package:faneron_mobile/src/core/data/storage/user.dart';
import 'package:faneron_mobile/src/core/presentation/error/cubit/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/router/router.dart';
import 'package:faneron_mobile/src/core/presentation/screens/exposition/exposition.dart';
import 'package:faneron_mobile/src/core/presentation/screens/laboratory/laboratory.dart';
import 'package:faneron_mobile/src/core/presentation/screens/main/main.dart';
import 'package:faneron_mobile/src/core/presentation/screens/profile/profile.dart';
import 'package:faneron_mobile/src/resource/configurate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inspector/inspector.dart';
import 'package:klocalizations_flutter/klocalizations_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/core/presentation/screens/first/first.dart';

void main() async {
  await setupApp();
  await setupHive();
  final bindings = await WidgetsFlutterBinding.ensureInitialized();

  ///preserve native splash screen from disappearing after bindings is ready for smooth tra
  FlutterNativeSplash.preserve(widgetsBinding: bindings);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SentryFlutter.init(
    SentryConfiguration.optionsConfiguration,
    appRunner: () => runApp(MyApp()),
  );
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(InterestProfileStorageAdapter());
  Hive.registerAdapter(EventStorageAdapter());
  Hive.registerAdapter(TopicStorageAdapter());
  Hive.registerAdapter(SpeakerStorageAdapter());
  Hive.registerAdapter(TicketStorageAdapter());
  Hive.registerAdapter(UserStorageAdapter());

  /// Last @HiveType(typeId: 5)
  await Future.wait([
    AuthStorageHive.init(),
    EventsDataStorageHive.init(),
    TicketsDataStorageHive.init(),
  ]);
}

Future<void> setupApp() async {
  await configureInjection(Env.dev);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return _AppMultiProvider(
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('ru', 'RU'),
          ],
          theme: ThemeData(
            primaryColor: Color(0xFFF36318),
            backgroundColor: Color(0xFF0A0A0A),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Color(0xFFF36318),
                  secondary: Color(0xFFF36318),
                ),
          ),
          home: StreamBuilder<bool>(
            stream: context.read<PerformanceProvider>().performanceController,
            builder: (context, snapshot) {
              return BlocProvider<RouterCubit>(
                create: (_) => getIt<RouterEventSink>() as RouterCubit,
                child: Inspector(
                  isEnabled: snapshot.hasData && snapshot.data!,
                  child: GestureDetector(
                    onTap: () {
                      context.read<FocusTextFieldProvider>().unFocusAll();
                    },
                    child: Router(
                      routerDelegate: AppRouterDelegate(),
                      backButtonDispatcher: RootBackButtonDispatcher(),
                    ),
                  ),
                ),
              );
            },
          ),
          builder: FlutterSmartDialog.init(),
        ),
      ),
    );
  }
}

class _AppMultiProvider extends StatelessWidget {
  final Widget child;

  const _AppMultiProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Main Bloc Providers
        BlocProvider<FirstBloc>(
          create: (_) => getIt<FirstBloc>(),
        ),
        BlocProvider<MainBloc>(
          create: (_) => getIt<MainBloc>(),
        ),
        BlocProvider<LaboratoryCubit>(
          create: (_) => getIt<LaboratoryCubit>(),
        ),
        BlocProvider<ExpositionCubit>(
          create: (_) => getIt<ExpositionCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (_) => getIt<ProfileCubit>(),
        ),
        BlocProvider<ErrorCubit>(
          create: (_) => getIt<ErrorCubit>(),
        ),

        ///Providers
        ChangeNotifierProvider<PerformanceProvider>(
          create: (_) => getIt<PerformanceProvider>(),
        ),
        ChangeNotifierProvider<ScrollProvider>(create: (_) => getIt<ScrollProvider>()),
        ChangeNotifierProvider<FocusTextFieldProvider>(create: (_) => getIt<FocusTextFieldProvider>()),
        ChangeNotifierProvider<AppBarMenuShowController>(create: (_) => getIt<AppBarMenuShowController>()),
        ChangeNotifierProvider<TextFieldControllers>(create: (_) => getIt<TextFieldControllers>()),
      ],
      child: child,
    );
  }
}
