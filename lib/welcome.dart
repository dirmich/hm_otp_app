import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            title: const Text("Hello"),
            foregroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          Flexible(
            child: Container(
                padding: const EdgeInsets.all(28),
                child: Scaffold(
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 30),
                      _otp(first: true),
                      _otp(),
                      _otp(),
                      _otp(),
                      _otp(),
                      _otp(last: true),
                      const SizedBox(width: 30),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }

  _otp({bool first = false, bool last = false}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: .5,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            print("value:$value");
            if (value.length == 1 && !last) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && !first) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.purple),
                  borderRadius: BorderRadius.circular(8))),
        ),
      ),
    );
  }
}
