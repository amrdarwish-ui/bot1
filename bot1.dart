import 'dart:cli';
import 'dart:mirrors';

import 'package:puppeteer/puppeteer.dart';

void main() async {
  List<String> list = [
    "من مصر الى عزه كتبت آليا",
    "من مصر الى عزه كتبت آليا",
    "من مصر الى عزه كتبت آليا",
    "من مصر الى عزه كتبت آليا",
    "كل الدعم الى غزه كتبت آليا",
    "كل الدعم الى غزه كتبت آليا",
    "كل الدعم الى غزه كتبت آليا",
    "انها قضيتى كتبت آليا"
        "انها قضيتى كتبت آليا",
    "انها قضيتى كتبت آليا",
  ];
  var b = await puppeteer.launch(headless: false);

  var page = await b.newPage();

  await page.goto("https://twitter.com/login");

  await Future.delayed(Duration(seconds: 2));

  await page.type(
      'input[name=session\\5busername_or_email\\5d]', "email.example");
  await Future.delayed(Duration(seconds: 5));

  await page.type('input[name=session\\5bpassword\\5d]', "pass");
  await Future.delayed(Duration(seconds: 3));

  var loginClick = await page.$(".r-1fz3rvf");

  await loginClick.click();

  await page.waitForNavigation();
  int count = 11;
  int i = 0;
  while (count <= 20) {
    await page.goto('https://twitter.com/compose/tweet');
    await Future.delayed(Duration(seconds: 2));
    await page.focus('.public-DraftEditor-content');
    await Future.delayed(Duration(seconds: 1));
    await page.keyboard.type("""
#GazaUnderAttak 
$count
${list[i]}
    تم كتابةهذه التغريده آليا """);

    await Future.delayed(Duration(seconds: 2));

    await page.click('div[data-testid=tweetButton]');

    await page.waitForNavigation();
    count++;
    i++;
  }
  b.close();
}
