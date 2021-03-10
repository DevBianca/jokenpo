import 'package:flutter/material.dart';
import 'dart:math';

class Jokenpo extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  int pedra = 0;
  int papel = 1;
  int tesoura = 2;

  String bot = "assets/images/bot.png";
  String cat = "assets/images/cat.png";
  String winner = "Escolha Pedra, Papel, ou Tesoura";

  void play(int cat) {
    int bot = Random().nextInt(3);

    setState(() {
      this.cat = this.getImageCat(cat);
      this.bot = this.getImageBot(bot);
      this.winner = this.getWinner(cat, bot);
    });
  }

  String getWinner(int cat, int bot) {
    if (cat == bot) {
      return "Empate!";
    } else if (cat == pedra && bot == tesoura) {
      return "Você venceu!";
    } else if (cat == papel && bot == pedra) {
      return "Você venceu!";
    } else if (cat == tesoura && bot == papel) {
      return "Você venceu!";
    } else {
      return "O bot ganhou!";
    }
  }

  String getImageCat(int cat) {
    if (cat == 0) {
      return "assets/images/pedra1.png";
    } else if (cat == 1) {
      return "assets/images/papel1.png";
    } else {
      return "assets/images/tesoura1.png";
    }
  }

  String getImageBot(int bot) {
    if (bot == 0) {
      return "assets/images/pedra2.png";
    } else if (bot == 1) {
      return "assets/images/papel2.png";
    } else {
      return "assets/images/tesoura2.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Jokenpo Cat'),
              centerTitle: true,
              backgroundColor: Colors.pink[100],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(winner,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Jogada do bot:",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          SizedBox(height: 10),
                          Image.asset(bot)
                        ],
                      )),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sua jogada: ",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          SizedBox(height: 10),
                          Image.asset(cat)
                        ],
                      )),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Botões das patinhas
                      Flexible(
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: FlatButton(
                              onPressed: () => play(pedra),
                              padding: EdgeInsets.all(0.0),
                              child: Image.asset('assets/images/pedra1.png'),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: FlatButton(
                              onPressed: () => play(papel),
                              padding: EdgeInsets.all(0.0),
                              child: Image.asset('assets/images/papel1.png'),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: FlatButton(
                              onPressed: () => play(tesoura),
                              padding: EdgeInsets.all(0.0),
                              child: Image.asset('assets/images/tesoura1.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
