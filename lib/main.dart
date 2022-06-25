import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Color(0xff010436),
        ),
        home: LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 200,
                height: 200,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  "https://i.pinimg.com/originals/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextfield(
                textEditingController: usernameController,
                isPassword: false,
                formKey: _formKey,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                textEditingController: passwordController,
                isPassword: true,
                formKey: _formKey,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("User logged in successfully")));
                  }
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ))),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextfield extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final GlobalKey<FormState> formKey;

  const CustomTextfield(
      {super.key,
      required this.textEditingController,
      required this.isPassword,
      required this.formKey});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  var isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return !widget.isPassword
        ? TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field is required.";
              }
              return null;
            },
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.pink),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          )
        : TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field is required.";
              }
              return null;
            },
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                  onPressed: () => {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        })
                      },
                  icon: !isPasswordVisible
                      ? Icon(
                          Icons.visibility,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        )),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.pink),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          );
  }
}
