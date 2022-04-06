import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '/UI/register.dart';

Future<bool> _onWillPop(context) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to exit MyHome App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      )) ??
      false;
}

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onWillPop(context);
      },
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black45.withOpacity(0.9), BlendMode.darken),
            image: const AssetImage('assets/MyHome.png'),
            fit: BoxFit.fitHeight,
          )),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1.1, -1.0),
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: (() {
                          SystemNavigator.pop();
                        }),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  const Text(
                    'Signin with phone number',
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  IntlPhoneField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  RawMaterialButton(
                    fillColor: const Color.fromARGB(255, 38, 10, 224),
                    constraints: const BoxConstraints.expand(
                      width: double.infinity,
                      height: 40,
                    ),
                    shape: RoundedRectangleBorder(
                        // side: const BorderSide(
                        //   width: 2,
                        // ),
                        borderRadius: BorderRadius.circular(3)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  const Text(
                    "We'll send OTP for verification",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SignInButton(
                          Buttons.FacebookNew,
                          onPressed: () {
                            // _showButtonPressDialog(context, 'Google');
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SignInButton(
                          Buttons.Google,
                          onPressed: () {
                            // _showButtonPressDialog(context, 'Google');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
