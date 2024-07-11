import 'package:flutter/material.dart';
import 'assets/styles/styles.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String numeroTela = "0";
  String operacao = "";

  double primeiroNumero = 0;
  double segundoNumero = 0;

  final double larguraEntreBotoes = 20.0;
  final double alturaEntreBotoes = 20.0;

  void atualizaNumero(String digito) {
    setState(() {
      numeroTela = numeroTela == "0" ? digito : "$numeroTela$digito";
    });
  }

  void excluiNumero() {
    setState(() {
      numeroTela = numeroTela == "0"
          ? "0"
          : numeroTela.substring(0, numeroTela.length - 1);
    });
  }

  void excluiTudo() {
    setState(() {
      numeroTela = "0";
      operacao = "";
      primeiroNumero = 0;
      segundoNumero = 0;
    });
  }

  void trocaNumero() {
    setState(() {
      primeiroNumero = double.parse(numeroTela);
      numeroTela = "0";
    });
  }

  void adicao() {
    setState(() {
      if (operacao != "") {
        fazerCalculo();
      }
      operacao = "adicao";
    });
    trocaNumero();
  }

  void subtracao() {
    setState(() {
      if (operacao != "") {
        fazerCalculo();
      }
      operacao = "subtracao";
    });
    trocaNumero();
  }

  void multiplicacao() {
    setState(() {
      if (operacao != "") {
        fazerCalculo();
      }
      operacao = "multiplicacao";
    });
    trocaNumero();
  }

  void divisao() {
    setState(() {
      if (operacao != "") {
        fazerCalculo();
      }
      operacao = "divisao";
    });
    trocaNumero();
  }

  void fazerCalculo() {
    segundoNumero = double.parse(numeroTela);
    setState(() {
      double resultado = primeiroNumero;
      if (operacao == "adicao") {
        resultado = primeiroNumero + segundoNumero;
      } else if (operacao == "subtracao") {
        resultado = primeiroNumero - segundoNumero;
      } else if (operacao == "multiplicacao") {
        resultado = primeiroNumero * segundoNumero;
      } else if (operacao == "divisao") {
        if (segundoNumero == 0.0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Impossível dividir por zero!")),
          );
        } else {
          resultado = primeiroNumero / segundoNumero;
        }
      }
      if (!(operacao == "divisao" && segundoNumero == 0.0)) {
        operacao = "";
        if (resultado == resultado.toInt()) {
          numeroTela = resultado.toInt().toString();
        } else {
          numeroTela = resultado.toString();
        }
      }
    });
  }

  void botaVirgula() {
    setState(() {
      numeroTela = "$numeroTela.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        numeroTela,
                        style: Styles.ledNumber,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: Styles.buttonEquals,
                              onPressed: () {
                                excluiTudo();
                              },
                              child: const Text(
                                'C',
                                style: Styles.buttonText,
                              ),
                            ),
                          ),
                          SizedBox(width: larguraEntreBotoes),
                          Expanded(
                            child: ElevatedButton(
                              style: Styles.buttonEquals,
                              onPressed: () {
                                excluiNumero();
                              },
                              child: const Text(
                                '<-',
                                style: Styles.buttonText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: alturaEntreBotoes),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("7");
                                },
                                child: const Text(
                                  "7",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("8");
                                },
                                child: const Text(
                                  "8",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("9");
                                },
                                child: const Text(
                                  "9",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.operationButton,
                                onPressed: () {
                                  adicao();
                                },
                                child: const Text(
                                  "+",
                                  style: Styles.operationNumber,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: alturaEntreBotoes),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("4");
                                },
                                child: const Text(
                                  "4",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("5");
                                },
                                child: const Text(
                                  "5",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("6");
                                },
                                child: const Text(
                                  "6",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.operationButton,
                                onPressed: () {
                                  subtracao();
                                },
                                child: const Text(
                                  "-",
                                  style: Styles.operationNumber,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: alturaEntreBotoes),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("1");
                                },
                                child: const Text(
                                  "1",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("2");
                                },
                                child: const Text(
                                  "2",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("3");
                                },
                                child: const Text(
                                  "3",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.operationButton,
                                onPressed: () {
                                  multiplicacao();
                                },
                                child: const Text(
                                  "X",
                                  style: Styles.operationNumber,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: alturaEntreBotoes),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonEquals,
                                onPressed: () {
                                  fazerCalculo();
                                },
                                child: const Text(
                                  "=",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  atualizaNumero("0");
                                },
                                child: const Text(
                                  "0",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                onPressed: () {
                                  botaVirgula();
                                },
                                child: const Text(
                                  ",",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                            SizedBox(width: larguraEntreBotoes),
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.operationButton,
                                onPressed: () {
                                  divisao();
                                },
                                child: const Text(
                                  "÷",
                                  style: Styles.operationNumber,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
