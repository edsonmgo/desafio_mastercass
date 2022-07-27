import 'package:desafio/screens/widgets/botton_anime.dart';
import 'package:desafio/screens/widgets/button_login_redeSocial.dart';
import 'package:desafio/screens/widgets/logo.dart';
import 'package:desafio/utils/color_schemes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final double _radius = 80;
  bool _avanca = false;

  final buttonKey = GlobalKey();
  Offset position = const Offset(0, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final RenderBox? box =
            buttonKey.currentContext!.findRenderObject() as RenderBox?;

        Offset? positionLocal = box?.localToGlobal(Offset.zero);

        if (positionLocal != null) {
          var meioWidth = box!.size.width / 2;
          var meioHeight = box.size.height / 2;

          setState(() {
            position = Offset(
                positionLocal.dx + meioWidth, positionLocal.dy + meioHeight);
          });
        }
      },
    );
  }

  ///set a posicação inicial para o animated container
  void getButtonPosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? box =
          buttonKey.currentContext!.findRenderObject() as RenderBox?;

      Offset? positionLocal = box?.localToGlobal(Offset.zero);

      if (positionLocal != null) {
        var meioWidth = box!.size.width / 2;
        var meioHeight = box.size.height / 2;

        setState(() {
          position = Offset(
              positionLocal.dx + meioWidth, positionLocal.dy + meioHeight);
        });
      }
    });
  }

  ///Mostra mensagem snackbar erro login
  void errorLogin() {
    final snackBar = SnackBar(
      backgroundColor: Color(0xFFB3261E),
      duration: const Duration(seconds: 1),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text('Erro no login'),
          const SizedBox(width: 200),
          Icon(
            Icons.close,
            color: Colors.white,
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: mediaQuery.width,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 800, maxWidth: 800),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(image: 'assets/images/logo.png'),
                    const SizedBox(height: 50),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: const TextField(
                        decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(
                              color: Color(0xFF6750A4),
                            ),
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: const TextField(
                        decoration: InputDecoration(
                          label: Text(
                            'Senha',
                            style: TextStyle(
                              color: Color(0xFF6750A4),
                            ),
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black.withOpacity(0.5),
                              decorationThickness: 1,
                            ),
                          ),
                          Botao(
                            label: 'Entrar',
                            isLoading: isLoading,
                            key: buttonKey,
                            onTap: () async {
                              errorLogin();
                              await Future.delayed(const Duration(seconds: 1));

                              setState(() {
                                isLoading = !isLoading;
                              });
                              getButtonPosition();
                              await Future.delayed(const Duration(seconds: 3));
                              setState(() {
                                isLoading = false;
                                _avanca = !_avanca;
                              });
                            },
                            aprovado: _avanca,
                            height: mediaQuery.height,
                            width: mediaQuery.width,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 100,
                      child: Divider(
                        color: lightColorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: mediaQuery.width * 0.9,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ButtonLoginRedeSocial(
                              imageLogo: 'assets/images/google.png',
                              color: Color(0xFFEA4335)),
                          ButtonLoginRedeSocial(
                              imageLogo: 'assets/images/facebook.png',
                              color: Color.fromARGB(255, 50, 129, 255)),
                          ButtonLoginRedeSocial(
                              imageLogo: 'assets/images/apple.png',
                              color: Color(0xFF000000)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Copyright © Masterclass 2022'),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              AnimatedPositioned(
                left: isLoading ? position.dx : 0,
                top: isLoading ? position.dy : 0,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    print('clicou tela cheia');
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    color: Color(0xFF6750A4),
                    height: _avanca ? mediaQuery.height : 0,
                    width: _avanca ? mediaQuery.width : 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
