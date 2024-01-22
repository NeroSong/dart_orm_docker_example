import '../prisma/generated_dart_client/client.dart';

void main(List<String> arguments) async {
  print('start');
  final client = PrismaClient();
  try {
    await client.$connect();
    final result = await client.user.findMany();
    print(result);
    print('success');
  } catch (e) {
    print(e);
  } finally {
    await client.$disconnect();
  }

  // holder to check the logs
  await Future.delayed(Duration(hours: 1));
}
