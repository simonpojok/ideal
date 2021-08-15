// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:peer2peer/screens/signup/signup_bloc.dart';
// import 'package:peer2peer/services/firebase/FirebaseAuthenticationService.dart';
//
// import '../../constants.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   late SignUpBloc _signUpBloc;
//   bool showPassword = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _signUpBloc =
//         SignUpBloc(authenticationService: FirebaseAuthenticationService());
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _signUpBloc.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0.0,
//         title: Text('SIGN UP'),
//         backgroundColor: kPrimaryColor,
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             EditText(
//               hintText: 'email',
//               stream: _signUpBloc.email,
//               sink: _signUpBloc.emailChanged,
//               iconData: Icons.email,
//             ),
//             EditText(
//               hintText: 'Password',
//               stream: _signUpBloc.password,
//               sink: _signUpBloc.passwordChanged,
//               iconData: Icons.email,
//               obscureText: true,
//               showText: showPassword,
//               keyboardType: TextInputType.text,
//               onShowText: () {
//                 setState(() {
//                   showPassword = !showPassword;
//                 });
//               },
//             ),
//             EditText(
//               hintText: 'Confirm Password',
//               stream: _signUpBloc.passwordConfirmation,
//               sink: _signUpBloc.passwordConfirmationChanged,
//               iconData: Icons.email,
//               obscureText: true,
//               showText: showPassword,
//               keyboardType: TextInputType.text,
//               onShowText: () {
//                 setState(() {
//                   showPassword = !showPassword;
//                 });
//               },
//             ),
//             // CustomButton(
//             //   label: "Create Account",
//             //   onClick: () {},
//             // )
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.only(top: size.height * 0.05),
//               child: Center(
//                 child: FloatingActionButton.extended(
//                   onPressed: null, label: Text("Create Account"),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onClick;
//   const CustomButton({
//     Key? key,
//     required this.label,
//     required this.onClick,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Material(
//           child: InkWell(
//             onTap: onClick,
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               decoration:
//                   BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     color: kPrimaryLightColor,
//                   ),
//               child: Center(
//                 child: Text(
//                   label,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6!
//                       .copyWith(color: Colors.black54),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class EditText extends StatelessWidget {
//   final Stream stream;
//   final Sink sink;
//   final String hintText;
//   final IconData iconData;
//   final bool obscureText;
//   final bool showText;
//   final TextInputType keyboardType;
//   final VoidCallback? onShowText;
//   const EditText({
//     Key? key,
//     required this.stream,
//     required this.sink,
//     required this.hintText,
//     required this.iconData,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.emailAddress,
//     this.showText = false,
//     this.onShowText,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: stream,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         return Container(
//           margin: EdgeInsets.only(top: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 decoration: BoxDecoration(
//                   color: kPrimaryDarkColor,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     suffixIcon: obscureText
//                         ? InkWell(
//                             onTap: onShowText,
//                             child: Icon(
//                               showText
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//                               color: Colors.white,
//                             ),
//                           )
//                         : null,
//                     hintText: hintText,
//                     border: InputBorder.none,
//                     hintStyle: Theme.of(context)
//                         .textTheme
//                         .headline6!
//                         .copyWith(color: kPrimaryTextColor.withOpacity(.3)),
//                   ),
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6!
//                       .copyWith(color: kPrimaryTextColor),
//                   onChanged: sink.add,
//                   obscureText: obscureText && !showText,
//                   keyboardType: keyboardType,
//                 ),
//               ),
//               if (snapshot.error != null)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, top: 5),
//                   child: Text(
//                     snapshot.error.toString(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .caption!
//                         .copyWith(color: Colors.red.shade300),
//                   ),
//                 )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
