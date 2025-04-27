import 'package:bloc_statemanagement/controller/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: MyHomePage(title: 'Login'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text(widget.title)),
      body:
      // BlocListener<LoginBloc, LoginState>(
      //   listener: (context, state) {
      //     if (state is LoginSuccess) {
      //       ScaffoldMessenger.of(
      //         context,
      //       ).showSnackBar(SnackBar(content: Text('Login Success')));
      //     } else if (state is LoginFailure) {
      //       ScaffoldMessenger.of(
      //         context,
      //       ).showSnackBar(SnackBar(content: Text(state.message)));
      //     }
      //   },
      //   child: BlocBuilder<LoginBloc, LoginState>(
      //     builder: (context, state) {
      //       return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: 'username'),
            ),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'password'),
            ),
            SizedBox(height: 10),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login Success'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Center(
                  child: state is LoginLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          Login(
                            username: _userController.text,
                            password: _passController.text,
                          ),
                        );
                      },
                      child: Text('login'),
                    ),
                );
              },
            ),
          ],
        ),
      ), //;
      //},
      //),
      //),
    );
  }
}
