import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:ceiba_app/ui/pages/post/widgets/post_page_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  testWidgets('PostPageElement displays post data', (WidgetTester tester) async {
    final user = PostModel(
      id: 1,
      title: 'John Doe adventure',
      body: 'This is a very interesting adventure',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PostPageElement(post: user),
        ),
      ),
    );

    expect(find.text('John Doe adventure'), findsOneWidget);
    expect(find.text('This is a very interesting adventure'), findsOneWidget);

    expect(find.text('john.doe@example.com'), findsNothing);
    expect(find.text('VER PUBLICACIONES'), findsNothing);
  });
}
