import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:itax/adapters/aadhaar_adapter.dart';
import 'package:itax/adapters/invoice_adapter.dart';
import 'package:itax/adapters/itr_adapter.dart';
import 'package:itax/adapters/pan_adapter.dart';
import 'package:itax/config/routes/app_route_config.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/auth_state.dart';
import 'package:itax/cubits/blog_cubit.dart';
import 'package:itax/cubits/business_profile_cubit.dart';
import 'package:itax/cubits/invoice_cubit.dart';
import 'package:itax/cubits/itr_cubit.dart';
import 'package:itax/cubits/ocr_cubit.dart';
import 'package:itax/cubits/pan_details_cubit.dart';
import 'package:itax/cubits/pdf_cubit.dart';
import 'package:itax/cubits/stratup_cubit.dart';
import 'package:itax/models/profile-models/aadhaar_model.dart';
import 'package:itax/models/invoice_model.dart';
import 'package:itax/models/itr_model.dart';
import 'package:itax/models/profile-models/pan_model.dart';
import 'package:itax/providers/providers_new/business-profile-provider.dart';
import 'package:itax/providers/providers_new/salaried-profile-provider.dart';
import 'package:itax/repositories/auth_repository.dart';
import 'package:itax/repositories/blog_repository.dart';
import 'package:itax/repositories/business_profile_repository.dart';
import 'package:itax/repositories/invoice_repository.dart';
import 'package:itax/repositories/itr_repository.dart';
import 'package:itax/repositories/pan_aadhaar_repository.dart';
import 'package:itax/repositories/pan_details_repository.dart';
import 'package:itax/repositories/pdf_repository.dart';
import 'package:itax/repositories/stratup_repository.dart';
import 'package:provider/provider.dart';

import 'cubits/pan_aadhaar_cubit.dart';
import 'repositories/ocr_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(AadhaarModelAdapter());
  Hive.registerAdapter(PanModelAdapter());
  Hive.registerAdapter(InvoiceModelAdapter());
  Hive.registerAdapter(ITRModelAdapter());

  await Hive.openBox<AadhaarModel>('aadhaar_models');
  await Hive.openBox<PanModel>('pan_models');
  await Hive.openBox<InvoiceModel>('invoice_models');
  await Hive.openBox<ITRModel>('itr_models');

  runApp(
    const MyApp(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (_) => AuthRepository()),
        Provider<BlogRepository>(create: (_) => BlogRepository()),
        Provider<ITRRepository>(create: (_) => ITRRepository()),
        Provider<InvoiceRepository>(create: (_) => InvoiceRepository()),
        Provider<PDFRepository>(create: (_) => PDFRepository()),
        Provider<OCRRepository>(create: (_) => OCRRepository()),
        Provider<PanAadhaarRepository>(create: (_) => PanAadhaarRepository()),
        Provider<PanDetailsRepository>(create: (_) => PanDetailsRepository()),
        Provider<BusinessProfileRepository>(
            create: (_) => BusinessProfileRepository()),
        Provider<StartupRepository>(create: (_) => StartupRepository()),

        // Add ChangeNotifierProviders here
        ChangeNotifierProvider(
          create: (_) => SalariedAadhaarPANProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BusinessProfileProvider(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            )..loadLoggedInUser(),
          ),
          BlocProvider<BlogCubit>(
            create: (context) => BlogCubit(
              blogRepository: context.read<BlogRepository>(),
            ),
          ),
          BlocProvider<ITRCubit>(
            create: (context) => ITRCubit(
              itrRepository: context.read<ITRRepository>(),
            ),
          ),
          BlocProvider<InvoiceCubit>(
            create: (context) => InvoiceCubit(
              repository: context.read<InvoiceRepository>(),
            ),
          ),
          BlocProvider<PDFCubit>(
            create: (context) => PDFCubit(
              pdfRepository: context.read<PDFRepository>(),
            ),
          ),
          BlocProvider<OCRCubit>(
            create: (context) => OCRCubit(
              ocrRepository: context.read<OCRRepository>(),
            ),
          ),
          BlocProvider<PanAadhaarStatusCubit>(
            create: (context) => PanAadhaarStatusCubit(
              context.read<PanAadhaarRepository>(),
            ),
          ),
          BlocProvider<PanDetailsCubit>(
            create: (context) => PanDetailsCubit(
              context.read<PanDetailsRepository>(),
            ),
          ),
          BlocProvider<BusinessProfileCubit>(
            create: (context) => BusinessProfileCubit(
              repository: context.read<BusinessProfileRepository>(),
            ),
          ),
          BlocProvider<StratupCubit>(
            create: (context) => StratupCubit(
              startupRepository: context.read<StartupRepository>(),
            ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            final myAppRouter = MyAppRouter();
            return MaterialApp.router(
              theme: ThemeData(fontFamily: 'Poppins'),
              debugShowCheckedModeBanner: false,
              routerConfig: myAppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
