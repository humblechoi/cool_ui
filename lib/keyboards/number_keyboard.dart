part of cool_ui;

class NumberKeyboard extends StatelessWidget {
  static const CKTextInputType inputType =
      const CKTextInputType(name: 'CKNumberKeyboard');
  static double getHeight(BuildContext ctx) {
    MediaQueryData mediaQuery = MediaQuery.of(ctx);
    return mediaQuery.size.width / 4 / 2 * 4;
  }

  final KeyboardController controller;
  const NumberKeyboard({this.controller});

  static register() {
    CoolKeyboard.addKeyboard(
        NumberKeyboard.inputType,
        KeyboardConfig(
            builder: (context, controller) {
              return NumberKeyboard(controller: controller);
            },
            getHeight: NumberKeyboard.getHeight));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Material(
      child: DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontSize: 23.0),
          child: Column(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 69, 193, 170),
                height: 40,
                width: mediaQuery.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        '적용',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        controller.doneAction();
                      },
                    ),
//                    FlatButton(
//                      child: Text(
//                        '모두삭제',
//                        style: TextStyle(color: Colors.white),
//                      ),
//                      onPressed: () {
//                        controller.deleteAll();
//                      },
//                    ),
                    FlatButton(
                      child: Text(
                        '삭제',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        controller.deleteOne();
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: getHeight(context),
                width: mediaQuery.size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
//                  color: Color(0xffafafaf),
                  border: Border.all(color: Colors.white),
                ),
                child: GridView.count(
                    childAspectRatio: 2 / 1,
                    mainAxisSpacing: 0.5,
                    crossAxisSpacing: 0.5,
                    padding: EdgeInsets.all(0.0),
                    crossAxisCount: 4,
                    children: <Widget>[
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('박스'),
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('콘티'),
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('직접입력'),
                      buildButton('0'),
                      buildButton('00'),
                      buildButton('0000'),

                      Container(
                        //color: Color(0xFFd3d6dd),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Center(
                            child: Icon(Icons.settings),
                          ),
                          onTap: () {
                            controller.doneAction();
                          },
                        ),
                      ),
//                  buildButton('00'),
//                  Container(
//                    color: Color(0xFFd3d6dd),
//                    child: GestureDetector(
//                      behavior: HitTestBehavior.translucent,
//                      child: Center(
//                        child: Text('X'),
//                      ),
//                      onTap: () {
//                        controller.deleteOne();
//                      },
//                    ),
//                  ),
                    ]),
              ),
            ],
          )),
    );
  }

  Widget buildButton(String title, {String value}) {
    if (value == null) {
      value = title;
    }
    return Container(
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: Text(title),
        ),
        onTap: () {
          controller.addText(value);
        },
      ),
    );
  }
}
