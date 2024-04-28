import 'package:flutter/material.dart';
import 'package:tranquil_mind/common_widget/round_button.dart';
import 'package:tranquil_mind/screen/inspirational_quotes/quote_api.dart';
import 'package:tranquil_mind/screen/inspirational_quotes/quotes_model.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  bool inProgress = false;
  quotes_model? quote;

  @override
  void initState() {
    _fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[600],
            elevation: 0,
            title: Text(
              "Tranquil Inspirations",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    quote?.q ?? "............",
                    style: const TextStyle(
                      fontSize: 30,
                     fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    quote?.a ?? ".....",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                      fontFamily: 'serif',
                    ),
                  ),

                  const Spacer(),
                  inProgress
                      ? const CircularProgressIndicator(
                    color: Colors.black26,
                  )
                      : Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: RoundButton(title: "Generate", onPressed: () {
                        _fetchQuote();
                        },
                        ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _fetchQuote() async {
    setState(() {
      inProgress = true;
    });
    try {
      final fetchedQuote = await Api.fetchRandomQuote();
      debugPrint(fetchedQuote.toJson().toString());
      setState(() {
        quote = fetchedQuote;
      });
    } catch (e) {
      debugPrint("Failed to generate quote");
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}