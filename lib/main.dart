import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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

void main() {
  runApp(
    const MyApp(),
    
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final myAppRouter = MyAppRouter();

//     // return Sizer(
//     //   builder: (context, orientation, screenType) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           routerConfig: myAppRouter.router,

//         );
//       // },
//     // );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            authRepository: AuthRepository(),
          )..loadLoggedInUser(),
        ),
        BlocProvider<BlogCubit>(
          create: (context) => BlogCubit(
            blogRepository: BlogRepository(),
          ),
        ),
        // BlocProvider<HomeCubit>(
        //   create: (context) => HomeCubit(),
        // ),
        BlocProvider<ITRCubit>(
          create: (context) => ITRCubit(
            itrRepository: ITRRepository(),
          ),
        ),
        BlocProvider<InvoiceCubit>(
          create: (context) => InvoiceCubit(
            repository: InvoiceRepository(),
          ),
        ),
        BlocProvider<PDFCubit>(
          create: (context) => PDFCubit(
            pdfRepository: PDFRepository(),
          ),
        ),
        BlocProvider<OCRCubit>(
          create: (context) => OCRCubit(
            ocrRepository: OCRRepository(),
          ),
        ),
        BlocProvider<PanAadhaarStatusCubit>(
          create: (context) => PanAadhaarStatusCubit(
            PanAadhaarRepository(),
          ),
        ),
        BlocProvider<PanDetailsCubit>(
          create: (context) => PanDetailsCubit(
            PanDetailsRepository(),
          ),
        ),
        BlocProvider<BusinessProfileCubit>(
          create: (context) => BusinessProfileCubit(
            repository: BusinessProfileRepository(),
          ),
        ),
        BlocProvider<StratupCubit>(
          create: (context) => StratupCubit(
            startupRepository: StartupRepository(),
          ),
        ),
      ],

      
      child: BlocListener<AuthCubit, AuthState>(
         listener: (context, state) {
          if (state is AuthLoading) {
            return ;
          }

          

          if (state is AuthSuccess) {
            if (state.loggedIn) {
              
                GoRouter.of(context).pushReplacement('/login');
              
            } else {
              GoRouter.of(context).pushReplacement('/home');
              
            }
          }
        },

        child: ScreenUtilInit(
        
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          // Use builder only if you need to use library outside ScreenUtilInit context
          builder: (_, child) {
            final myAppRouter = MyAppRouter();
            return MaterialApp.router(
              theme: ThemeData(
                fontFamily: 'Poppins',
              ),
              debugShowCheckedModeBanner: false,
              routerConfig: myAppRouter.router,
              
             
            );
          },
        ),
      ),
    );
  }
}
