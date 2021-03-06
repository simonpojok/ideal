import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/authentication/AuthenticationBloc.dart';
import 'package:ideal/src/blocs/authentication/AuthenticationBlocProvider.dart';
import 'package:ideal/src/blocs/deal/DealBloc.dart';
import 'package:ideal/src/blocs/deal/DealBlocProvider.dart';
import 'package:ideal/src/blocs/loan_offer/LoanOfferBloc.dart';
import 'package:ideal/src/blocs/loan_offer/LoanOfferBlocProvider.dart';
import 'package:ideal/src/blocs/sacco/SaccoBloc.dart';
import 'package:ideal/src/blocs/sacco/SaccoBlocProvider.dart';
import 'package:ideal/src/blocs/user_profile/UserProfileBloc.dart';
import 'package:ideal/src/blocs/user_profile/UserProfileBlocProvider.dart';
import 'package:ideal/src/screens/calc/loan_calculator.dart';
import 'package:ideal/src/screens/dashboard/DashboardScreen.dart';
import 'package:ideal/src/screens/deal/deal_detail.dart';
import 'package:ideal/src/screens/deal_create/create_deal_screen.dart';
import 'package:ideal/src/screens/deals/deals_screen.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';
import 'package:ideal/src/screens/message/MessageScreen.dart';
import 'package:ideal/src/screens/messages/MessagesScreen.dart';
import 'package:ideal/src/screens/my_sacco/MySaccoGroup.dart';
import 'package:ideal/src/screens/offer/OfferScreen.dart';
import 'package:ideal/src/screens/offers/offers_screen.dart';
import 'package:ideal/src/screens/profile/user_profile_screen.dart';
import 'package:ideal/src/screens/register_sacco/register_sacco.dart';
import 'package:ideal/src/screens/sacco/SaccoScreen.dart';
import 'package:ideal/src/screens/saccos/saccos_screen.dart';
import 'package:ideal/src/screens/signup/SignUpScreen.dart';
import 'package:ideal/src/screens/welcome/WelcomeScreen.dart';
import 'package:ideal/src/services/authentication/AuthenticationApi.dart';
import 'package:ideal/src/services/authentication/FirebaseAuthenticationService.dart';
import 'package:ideal/src/services/deal/DealApi.dart';
import 'package:ideal/src/services/deal/DealFirebaseService.dart';
import 'package:ideal/src/services/loan_offer/LoanOfferApi.dart';
import 'package:ideal/src/services/loan_offer/LoanOfferFirebaseService.dart';
import 'package:ideal/src/services/saccos/FirebaseSaccoService.dart';
import 'package:ideal/src/services/saccos/SaccoServiceApi.dart';
import 'package:ideal/src/services/user_profle/FirebaseUserProfileService.dart';
import 'package:ideal/src/services/user_profle/UserProfileApi.dart';

MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  switch (settings.name) {
    case LoginScreen.LOGIN_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => LoginScreen());
      }

    case SignUpScreen.SIGNUP_SCREEN_ROUTE:
      {
        AuthenticationApi api = FirebaseAuthenticationService();
        AuthenticationBloc bloc = AuthenticationBloc(api: api);

        return MaterialPageRoute(
          builder: (builder) => AuthenticationBlocProvider(
            child: SignUpScreen(),
            bloc: bloc,
          ),
        );
      }

    case DashboardScreen.DASHBOARD_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(builder: (context) => DashboardScreen());
      }

    case MessagesScreen.MESSAGE_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(builder: (context) => MessagesScreen());
      }

    case MessageScreen.MESSAGE_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(builder: (context) => MessageScreen());
      }

    case DealsScreen.DEALS_SCREEN:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        DealApi service = DealFirebaseService();
        DealBloc bloc = DealBloc(dealApi: service);
        AuthenticationApi api = FirebaseAuthenticationService();
        AuthenticationBloc authenticationBloc = AuthenticationBloc(api: api);
        return MaterialPageRoute(
          builder: (context) => AuthenticationBlocProvider(
              child: DealBlocProvider(
                dealBloc: bloc,
                child: DealsScreen(),
              ),
              bloc: authenticationBloc),
        );
      }

    case DealsScreen.USER_DEALS_SCREEN:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        DealApi service = DealFirebaseService();
        DealBloc bloc = DealBloc(dealApi: service);
        AuthenticationApi api = FirebaseAuthenticationService();
        AuthenticationBloc authenticationBloc = AuthenticationBloc(api: api);
        return MaterialPageRoute(
          builder: (context) => AuthenticationBlocProvider(
              child: DealBlocProvider(
                dealBloc: bloc,
                child: DealsScreen(
                  userDeals: true,
                ),
              ),
              bloc: authenticationBloc),
        );
      }

    case DealScreen.DEAL_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(builder: (context) => DealScreen());
      }

    case SaccosScreen.SACCOS_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        final SaccoServiceApi _service = FirebaseSaccoService();
        final SaccoBloc _bloc = SaccoBloc(_service);
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return SaccoBlocProvider(
              child: SaccosScreen(),
              saccoBloc: _bloc,
            );
          },
        );
      }

    case SaccoScreen.SACCO_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(builder: (context) => SaccoScreen());
      }
    case OffersScreen.OFFERS_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        final LoanOfferApi _service = FirebaseLoanOfferService();
        final LoanOfferBloc _bloc = LoanOfferBloc(_service);
        return MaterialPageRoute(builder: (BuildContext context) {
          return LoanOfferBlocProvider(
            child: OffersScreen(),
            loanOfferBloc: _bloc,
          );
        });
      }

    case LoanCalculatorScreen.LOAN_CALCULATOR_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(
            builder: (BuildContext context) => LoanCalculatorScreen());
      }

    case UserProfileScreen.PROFILE_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(
          builder: (BuildContext context) => UserProfileBlocProvider(
            userProfileBloc: UserProfileBloc(api: FirebaseUserProfileService()),
            child: UserProfileScreen(),
          ),
        );
      }

    case RegisterSaccoScreen.REGISTER_SACCO_SCREEN:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        final SaccoServiceApi _service = FirebaseSaccoService();
        final SaccoBloc _bloc = SaccoBloc(_service);
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return SaccoBlocProvider(
              child: RegisterSaccoScreen(),
              saccoBloc: _bloc,
            );
          },
        );
      }

    case MySaccoGroupScreen.MY_SACCO_GROUP_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        return MaterialPageRoute(builder: (BuildContext context) {
          return MySaccoGroupScreen();
        });
      }

    case OfferScreen.OFFER_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        final LoanOfferApi _service = FirebaseLoanOfferService();
        final LoanOfferBloc _bloc = LoanOfferBloc(_service);
        return MaterialPageRoute(builder: (BuildContext context) {
          return LoanOfferBlocProvider(
            child: OfferScreen(),
            loanOfferBloc: _bloc,
          );
        });
      }

    case CreateDealScreen.CREATE_DEAL_SCREEN_ROUTE:
      {
        if (_firebaseAuth.currentUser == null)
          return MaterialPageRoute(builder: (context) => WelcomeScreen());

        final DealApi service = DealFirebaseService();
        final DealBloc _bloc = DealBloc(dealApi: service);
        AuthenticationApi api = FirebaseAuthenticationService();
        AuthenticationBloc authenticationBloc = AuthenticationBloc(api: api);
        return MaterialPageRoute(builder: (BuildContext context) {
          return AuthenticationBlocProvider(
            bloc: authenticationBloc,
            child: DealBlocProvider(child: CreateDealScreen(), dealBloc: _bloc),
          );
        });
      }

    default:
      {
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      }
  }
}
