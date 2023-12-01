import 'package:chat_ex01/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSingupScreen extends StatefulWidget {
  const LoginSingupScreen({super.key});

  @override
  State<LoginSingupScreen> createState() => _LoginSingupScreenState();
}

class _LoginSingupScreenState extends State<LoginSingupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String email = '';
  String password = '';

  void runValidation() {
    bool isValid = _formKey.currentState!.validate();
    // validate함수는 validator 에서 null을 리턴할 때만 true를 반환한다.
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/red.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Welcome ',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                        Text(
                          isSignupScreen ? 'to Yummy Chat!' : ' back',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isSignupScreen
                          ? 'Singup to continue'
                          : 'Login to continue',
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          //배경
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: 200,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: const EdgeInsets.all(20),
              height: isSignupScreen ? 280 : 250,
              width: MediaQuery.of(context).size.width - 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text('LOGIN',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1)),
                            if (!isSignupScreen) //사인업이 선택되지 않으면 밑줄 보인다.
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (isSignupScreen)
                            TextFormField(
                              key: const ValueKey(1),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return 'Please enter at least 4 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userName = value!;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                ),
                                hintText: 'User name',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(10), //내용주위폭
                              ),
                            ),
                          const SizedBox(height: 8),
                          TextFormField(
                            key: const ValueKey(2),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Please enter at least 4 characters';
                              } else if (!value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              email = value!;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Palette.iconColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              hintText: 'email',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Palette.textColor1),
                              contentPadding: EdgeInsets.all(10), //내용주위폭
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            key: const ValueKey(3),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              password = value!;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Palette.iconColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              hintText: 'password',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Palette.textColor1),
                              contentPadding: EdgeInsets.all(10), //내용주위폭
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //텍스트 폼 필드
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: isSignupScreen ? 450 : 420,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 139, 137, 137)
                            .withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(1, 3)),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    runValidation();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.orange,
                          Color.fromARGB(255, 226, 17, 2)
                        ],
                        begin: Alignment.topLeft, // 그라디언트 방향
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1)),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //전송버튼
          Positioned(
            top: MediaQuery.of(context).size.height - 200,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? 'or SignUp with' : 'or Login with'),
                const SizedBox(height: 15),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Google'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Palette.googleColor,
                    minimumSize: const Size(155, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
