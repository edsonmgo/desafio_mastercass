import 'package:flutter/material.dart';

const double _larguraBotao = 100;
const double _larguraLoading = 50;
const double _radius = 40;

class Botao extends StatelessWidget {
  final String label;
  final bool isLoading;
  final double width;
  final double height;
  final bool aprovado;
  final Function() onTap;
  const Botao(
      {Key? key,
      required this.label,
      required this.isLoading,
      required this.onTap,
      required this.width,
      required this.height,
      required this.aprovado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceIn,
          width: isLoading ? _larguraLoading : _larguraBotao,
          height: aprovado == false ? 50 : height,
          decoration: BoxDecoration(
            color: Color(0xFF6750A4),
            borderRadius: BorderRadius.circular(aprovado == false ? 40 : 0),
          ),
          alignment: Alignment.center,
          child: aprovado == false
              ? isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Center(
                      child: Text(
                      label,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ))
              : Container(),
        ));
  }
}
