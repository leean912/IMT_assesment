// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/components/home/avatar_list_widget.dart';
import 'package:flutter_profile_demo/screens/favourite_profile_page.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils/test_utils.dart';

void main() {
  testWidgets('Home Page render correctly in screen1', (WidgetTester tester) async {
    await _pumpPage(tester);

    expect(find.byType(RefreshIndicator), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(AvatarListWidget), findsOneWidget);

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);

    expect(find.byType(FavouriteProfilePage), findsNothing);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favourite'), findsOneWidget);
  });
}

Future<void> _pumpPage(WidgetTester tester) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await tester.pumpWidget(
    await getTestMaterialAppBoilerplate(const HomePage()),
  );

  await tester.pump();
}
