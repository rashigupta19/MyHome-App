import 'package:flutter/material.dart';
import '/UI/otp.dart';

_FormField(String text, Icon icon, {String? Function(String?)? validator}) {
  return TextFormField(
      style: const TextStyle(),
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter ' + text + ' Here',
          suffixIcon: icon,
          label: Text(text),
          labelStyle: const TextStyle(fontSize: 20),
          errorStyle: const TextStyle(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Colors.red, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Colors.red, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Colors.blue, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Colors.white, width: 2))),
      validator: validator);
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        Navigator.pop(context);
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
                  'Register your account',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                _FormField(
                  "Username",
                  const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.red,
                    size: 30,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required Field';
                    }
                    if (value.length < 6) {
                      return 'Length should be greater than 6';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _FormField(
                    "Email",
                    const Icon(
                      Icons.email,
                      color: Colors.yellow,
                      size: 30,
                    ), validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is a required Field';
                  }
                  if (!(value.contains('@')) || !(value.contains('.'))) {
                    return 'Email should be valid form';
                  }
                  return null;
                }),
                const SizedBox(height: 20),
                _FormField(
                    "Password",
                    const Icon(
                      Icons.security,
                      color: Colors.blue,
                      size: 30,
                    ), validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                }),
                const SizedBox(height: 20),
                _FormField(
                    "Re-Enter Password",
                    const Icon(
                      Icons.verified,
                      color: Colors.green,
                      size: 30,
                    ), validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                }),
                const SizedBox(height: 20),
                RawMaterialButton(
                  fillColor: const Color.fromARGB(255, 38, 10, 224),
                  constraints: const BoxConstraints.expand(
                    width: double.infinity,
                    height: 45,
                  ),
                  shape: RoundedRectangleBorder(
                      // side: const BorderSide(
                      //   width: 2,
                      // ),
                      borderRadius: BorderRadius.circular(3)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Otp()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
