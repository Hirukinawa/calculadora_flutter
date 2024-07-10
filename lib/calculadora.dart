import 'package:flutter/material.dart';
import 'assets/styles/styles.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String numeroTela = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                color: Colors.white,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        numeroTela,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("7");
                            },
                            child: const Text(
                              "7",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("8");
                            },
                            child: const Text(
                              "8",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("9");
                            },
                            child: const Text(
                              "9",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              adicao();
                            },
                            child: const Text(
                              "+",
                              style: Styles.buttonText,
                            ),
                          )
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("4");
                            },
                            child: const Text(
                              "4",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("5");
                            },
                            child: const Text(
                              "5",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("6");
                            },
                            child: const Text(
                              "6",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              subtracao();
                            },
                            child: const Text(
                              "-",
                              style: Styles.buttonText,
                            ),
                          )
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("1");
                            },
                            child: const Text(
                              "1",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("2");
                            },
                            child: const Text(
                              "2",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("3");
                            },
                            child: const Text(
                              "3",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              multiplicacao();
                            },
                            child: const Text(
                              "X",
                              style: Styles.buttonText,
                            ),
                          )
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            /* style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF186A11),
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ), */
                            style: Styles.buttonEquals,
                            onPressed: () {
                              fazerCalculo();
                            },
                            child: const Text(
                              "=",
                              style: Styles.buttonEqualsText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              atualizaNumero("0");
                            },
                            child: const Text(
                              "0",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              botaVirgula();
                            },
                            child: const Text(
                              ",",
                              style: Styles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            style: Styles.buttonStyle,
                            onPressed: () {
                              divisao();
                            },
                            child: const Text(
                              "/",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void atualizaNumero(String digito) {
    setState(() {
      numeroTela = numeroTela == "0"
          ? digito
          : ((int.parse(numeroTela) * 10) + int.parse(digito)).toString();
    });
  }

  void excluiNumero() {
    setState(() {
      numeroTela = numeroTela == "0"
          ? "0"
          : (double.parse(numeroTela) / 10).toInt().toString();
    });
  }

  void adicao() {}

  void subtracao() {}

  void multiplicacao() {}

  void divisao() {}

  void fazerCalculo() {}

  void botaVirgula() {}
}
