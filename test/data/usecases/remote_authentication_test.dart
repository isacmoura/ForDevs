import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});
  
  Future<void>? auth() async {
    await httpClient.request(url: url);
  }
}

abstract class HttpClient {
  Future<void>? request({String url});
}

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  test('Should call HttpClient with correct URL', () async {
    //Arrange
    final httpClient = HttpClientMock();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);

    //Act
    await sut.auth();
    
    //Assert
    verify(() => httpClient.request(url: url));
  });
}