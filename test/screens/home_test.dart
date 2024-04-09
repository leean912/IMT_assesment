// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/components/home/avatar_list_widget.dart';
import 'package:flutter_profile_demo/cubits/favourite_profile_cubit/favourite_profile_cubit.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/screens/favourite_profile_page.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../test_utils/test_utils.dart';

void main() {
  late Box<ProfileDetailsDb> profileBox;

  setUpAll(() async {
    // Initialize Hive
    // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    // Hive.init('appDocumentDir.path');
    // await Hive.openBox<ProfileDetailsDb>('profiles');
    // Hive.registerAdapter(ProfileDetailsDbAdapter());
    // profileBox = await Hive.openBox<ProfileDetailsDb>('profiles');
  });

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

  testWidgets('Home Page render correctly in screen2', (WidgetTester tester) async {
    await _pumpPage(tester,
        index: 1,
        // profileBox: profileBox,
        favouriteProfileCubit: FavouriteProfileCubit.initial(
          state: const FavouriteProfileStateLoaded(newFavouriteProfileList: []),
        ));

    // expect(find.text('Favourite List'), findsOneWidget);
    // expect(find.byType(RefreshIndicator), findsNothing);
    // expect(find.byType(SingleChildScrollView), findsNothing);
    // expect(find.byType(AvatarListWidget), findsNothing);

    // expect(find.byType(BottomNavigationBar), findsOneWidget);
    // expect(find.byIcon(Icons.home), findsOneWidget);
    // expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);

    // expect(find.byType(FavouriteProfilePage), findsOneWidget);

    // expect(find.text('Home'), findsOneWidget);
    // expect(find.text('Favourite'), findsOneWidget);
  });
}

Future<void> _pumpPage(
  WidgetTester tester, {
  int? index,
  FavouriteProfileCubit? favouriteProfileCubit,
  Box<ProfileDetailsDb>? profileBox,
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await registerDbSl(profileBox: profileBox);

  registerSl(
    favouriteProfileCubit: favouriteProfileCubit,
  );

  await tester.pumpWidget(
    await getTestMaterialAppBoilerplate(
      HomePage(
        selectedIndex: index,
      ),
    ),
  );

  await tester.pump();
}
