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
import 'package:itax/providers/providers_old/bank_api.dart';
import 'package:itax/providers/providers_old/bill_create_provider.dart';
import 'package:itax/providers/providers_old/bussiness_data.dart';
import 'package:itax/providers/providers_old/bussiness_profile.dart';
import 'package:itax/providers/providers_old/form_16_calculation.dart';
import 'package:itax/providers/providers_old/gst_api.dart';
import 'package:itax/providers/providers_old/gst_calculation_outward.dart';
import 'package:itax/providers/providers_old/gst_onlinelist_add.dart';
import 'package:itax/providers/providers_old/gstr1_json_pro.dart';
import 'package:itax/providers/providers_old/gstr3b_provider.dart';
import 'package:itax/providers/providers_old/gstr4_cmp_80.dart';
import 'package:itax/providers/providers_old/invoice_summary_provider.dart';
import 'package:itax/providers/providers_old/itr_provider%20copy.dart';
import 'package:itax/providers/providers_old/manually_itr_form16.dart';
import 'package:itax/providers/providers_old/mca_api.dart';
import 'package:itax/providers/providers_old/rate_percent_calculation.dart';
import 'package:itax/providers/providers_old/services_gst_links.dart';
import 'package:itax/providers/providers_old/services_incometax_links.dart';
import 'package:itax/providers/providers_old/services_post_office_link.dart';
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
        ChangeNotifierProvider<ITRProvider>(
          create: (context) => ITRProvider(),
        ),
        ChangeNotifierProvider<From16Calculation>(
          create: (context) => From16Calculation(),
        ),
        ChangeNotifierProvider<ManualITRCalculation>(
          create: (context) => ManualITRCalculation(),
        ),
        ChangeNotifierProvider<ManuallyITRTaxPaid>(
          create: (context) => ManuallyITRTaxPaid(),
        ),
        ChangeNotifierProvider<ItrManuallyTCSDetails>(
          create: (context) => ItrManuallyTCSDetails(),
        ),
        ChangeNotifierProvider<itrManuallyProfileSection>(
          create: (context) => itrManuallyProfileSection(),
        ),
        ChangeNotifierProvider<itrManuallyTDSNonSalary>(
          create: (context) => itrManuallyTDSNonSalary(),
        ),
        ChangeNotifierProvider<itrManuallyTDSonSalary>(
          create: (context) => itrManuallyTDSonSalary(),
        ),
        ChangeNotifierProvider<GSTR3BCardNo2>(
          create: (context) => GSTR3BCardNo2(),
        ),
        ChangeNotifierProvider<GSTR3B>(
          create: (context) => GSTR3B(),
        ),
        ChangeNotifierProvider<mca>(
          create: (context) => mca(),
        ),
        ChangeNotifierProvider<BankApi>(
          create: (context) => BankApi(),
        ),
        
        ChangeNotifierProvider<itrManullyRefandSection>(
            create: (_) => itrManullyRefandSection(ManuallyITRTaxPaid())),
        ChangeNotifierProvider<BussinessProfile>(
          create: (context) => BussinessProfile(),
        ),
         ChangeNotifierProvider<ITRProvider>(
          create: (context) => ITRProvider(),
        ),
     
      
        ChangeNotifierProvider<GstSection>(create: (_) => GstSection()),
        ChangeNotifierProvider<GstCalculation>(create: (_) => GstCalculation()),
        ChangeNotifierProvider<RecordProvider>(create: (_) => RecordProvider()),
        ChangeNotifierProvider<MyDataModel>(create: (_) => MyDataModel()),
        ChangeNotifierProvider<GSTR3B>(create: (_) => GSTR3B()),
        ChangeNotifierProvider<gstinLink>(create: (_) => gstinLink()),
        ChangeNotifierProvider<PanSearch>(create: (_) => PanSearch()),
        ChangeNotifierProvider<PanVerify>(create: (_) => PanVerify()),
        ChangeNotifierProvider<SearchTan>(create: (_) => SearchTan()),
        ChangeNotifierProvider<PincodeByCity>(create: (_) => PincodeByCity()),
        ChangeNotifierProvider<PostOfficebyCity>(
            create: (_) => PostOfficebyCity()),
        ChangeNotifierProvider<PincodeByInfo>(create: (_) => PincodeByInfo()),
        ChangeNotifierProvider<GSTINTrackReturn>(
            create: (_) => GSTINTrackReturn()),
        ChangeNotifierProvider<Gstr4CMP>(create: (_) => Gstr4CMP()),
        ChangeNotifierProvider(create: (_) => BillCreateNotifier()),
        ChangeNotifierProvider<InvoiceSummaryProvider>(
          create: (context) => InvoiceSummaryProvider(),
        ),
        ChangeNotifierProvider<GstBussinessData>(
            create: (_) => GstBussinessData()),
        ChangeNotifierProvider<RatePercentCalculation>(
            create: (_) => RatePercentCalculation()),

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
