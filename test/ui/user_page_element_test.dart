import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/pages/user/widgets/user_page_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  setUp(() {});

  testWidgets('UserPageElement displays user data', (WidgetTester tester) async {
    final user = UserModel(
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '+123456789',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: UserPageElement(user: user),
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('+123456789'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
    expect(find.text('VER PUBLICACIONES'), findsOneWidget);
  });
}
