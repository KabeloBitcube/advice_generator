import 'package:advice_generator/Data/DataSource/remote_data_source.dart';
import 'package:advice_generator/Domain/Entity/advice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = RemoteDataSource(client: mockHttpClient);
  });

  group('RemoteDataSource - ', () {
    group('getRandomAdvice function - ', () {
      test(
        'given RemoteDataSource class, when getRandomAdvice function is called and status code is 200, then Advice should be returned',
        () async {
          // Arrange
          when(
            () => mockHttpClient.get(
              Uri.parse('https://api.adviceslip.com/advice'),
            ),
          ).thenAnswer((answer) async {
            return Response(
              '{"slip": { "id": 154, "advice": "State the problem in words as clearly as possible."}}',
              200,
            );
          });

          // Act
          final advice = await remoteDataSource.getRandomAdvice();

          // Assert
          expect(advice, isA<Advice>());
        },
      );


      test(
        'given RemoteDataSource class, when getRandomAdvice function is called and status code is not 200, then an exception should be thrown', 
        () async {
          // Arrange
          when(
            () => mockHttpClient.get(
              Uri.parse('https://api.adviceslip.com/advice'),
            ),
          ).thenAnswer((answer) async {
            return Response(
              '{{ }}',
              500,
            );
          });

          // Act
          final advice = remoteDataSource.getRandomAdvice();

          // Assert
          expect(advice, throwsException);
        });
    });
  });
}
