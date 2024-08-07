# Data Class
## 기본 생성
1. 패키지 임포트: `freezed_annotation` 
2. 파트 프리즈드 설정: `ptf`
3. 파트 시리얼라즈 설정: `pts`
4. 데이터 클래스 템플릿: `fdataclass`
5. 클래스 이름 설정
6. 필요한 필드들 설정
7. 시리얼라이즈 함수: `fromJson`

## 추가 설정
1. `const ClassName._();`
2. 문자열 함수 오버라이드: `toString`
3. 함수 추가
4. 필드 디폴트 값.
5. 클래스 엠프티 ...

## 생성 예시
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/*
{
"id": 1,
"name": "Leanne Graham",
"username": "Bret",
"email": "Sincere@april.biz",
"address": {5 items},
"phone": "1-770-736-8031 x56442",
"website": "hildegard.org",
"company": {3 items}
},
 */

@freezed
class User with _$User {
  const User._();
  const factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  String toString() => 'User(id: $id)';
}
```

# Provider
## 생성
1. 패키지 임포트: `riverpod_annotation` 
2. 리버포드 파트 설정: `rvp` 
3. 리버포드 프로바이터 템플릿: `riverpod`
4. 리턴 타입 설정
5. 프로바이더 이름 설정
6. Ref 이름 설정
7. 옵션
   - Family 이면 변수와 변수 타입 
   - 프로바이더 내부에서 async 함수를 사용 하려면 async 키워드
8. 리턴 값

## 생성 예시
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );
}
```

# Future Provider
## 생성
1. 패키지 임포트: `riverpod_annotation` 
2. 리버포드 파트 설정: `rvp` 
3. 리버포드 프로바이터 템플릿: `riverpodF`
4. 리턴 타입 설정: `FutureOr<T>`
5. 프로바이더 이름 설정
6. Ref 이름 설정
7. 옵션
   - Family 이면 변수와 변수 타입 
   - 프로바이더 내부에서 async 함수를 사용 하려면 async 키워드
8. 리턴 값

## 생성 예시
```dart
import 'package:provider/models/user.dart';
import 'package:provider/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
FutureOr<List<User>> userList(UserListRef ref) async {
  ref.onDispose(() {
    print('[userListProvider] disposed');
  });

  final response = await ref.watch(dioProvider).get('/users');
  final usersList = [for (final user in response.data) User.fromJson(user)];

  return usersList;
}

@riverpod
FutureOr<User> userDetail(UserDetailRef ref, int id) async {
  ref.onDispose(() {
    print('[userDetailProvider] disposed');
  });

  final response = await ref.watch(dioProvider).get('/users/$id');
  // ref.keepAlive();
  final user = User.fromJson(response.data);

  return user;
}
```

## 사용 예시
```dart
final userList = ref.watch(userListProvider);
final userDetail = ref.watch(userDetailProvider(userId));

userList.when(
    data: (users){},
    error: (e, st){},
    loading: (){}
)
```

## 캐싱
| |autoDispose|
|:---|:---|
|@riverpod|X|
|@riverpod + ref.keepAlive()|O|
|@Riverpod(keepAlive=true)|O|
|@Riverpod(keepAlive=false)|X|
|@Riverpod(keepAlive=false) + ref.keepAlive()|O|

# Strem Provider
## 생성
1. 패키지 임포트: `riverpod_annotation` 
2. 리버포드 파트 설정: `rvp` 
3. 리버포드 프로바이터 템플릿: `riverpodS`
4. 리턴 타입 설정: `Stream<T>`
5. 프로바이더 이름 설정
6. Ref 이름 설정
7. 옵션
   - Family 이면 변수와 변수 타입 
   - 프로바이더 내부에서 async 함수를 사용 하려면 async 키워드
8. 리턴 값

## 생성 예시
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticker_provider.g.dart';

@riverpod
Stream<int> ticker(TickerRef ref) {
  ref.onDispose(() {
    print('[tickerProvider] disposed');
  });
  return Stream.periodic(const Duration(seconds: 1), (time) => time++);
}

```

## 사용 예시
```dart
final ticker = ref.watch(tickerProvider);

ticker.when(
    data: (value){},
    error: (e, st){},
    loading: (){}
)
```

# Notifier Provider
## 생성
1. 패키지 임포트: `riverpod_annotation` 
2. 리버포드 파트 설정: `rvp` 
3. 리버포드 프로바이터 템플릿: 
   - `riverpodClass`
   - `riverpodClassKeepAlive`
4. 리턴 타입 설정: `[T] build()`
5. 초기값 설정: `build(T val)`
6. 리던 값
7. 필요한 함수 추가

## 생성 예시
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build(int initialValue) {
    return initialValue;
  }

  void increments() {
    state++;
  }
}
```


<!-- > [!NOTE]  
> Highlights information that users should take into account, even when skimming.

> [!TIP]
> Optional information to help a user be more successful.

> [!IMPORTANT]  
> Crucial information necessary for users to succeed.

> [!WARNING]  
> Critical content demanding immediate user attention due to potential risks.

> [!CAUTION]
> Negative potential consequences of an action. -->
