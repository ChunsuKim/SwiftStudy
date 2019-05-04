## Array
```swift
var cities = ["Seoul", "New York", "LA", "Santiago"]
let length = cities.count

for i in 0..<length {
    print("\(i)번째 배열 원소는 \(cities[i])입니다")
}

// 출력값) 0번째 배열 원소는 Seoul입니다
//       1번째 배열 원소는 New York입니다
//       2번째 배열 원소는 LA입니다
//       3번째 배열 원소는 Santiago입니다



for row in cities {
    let index = cities.firstIndex(of: row)
    print("\(index!)번째 배열의 원소는 \(row) 입니다.")
}

// 출력값) 0번째 배열의 원소는 Seoul 입니다.
//       1번째 배열의 원소는 New York 입니다.
//       2번째 배열의 원소는 LA 입니다.
//       3번째 배열의 원소는 Santiago 입니다.



var list = [String]()

if list.isEmpty {
    print("배열이 비어있습니다.")
} else {
    print("배열에 \(list.count)개의 아이템이 있습니다.")
}

// 출력값) 배열이 비어있습니다.



var someCities = [String]() // 빈 array 선언 및 초기화

someCities.append("Seoul")  // Seoul을 append를 사용하여 array 맨 마지막에 추가
print(someCities)
// 출력값) ["Seoul"]

someCities.append("New York")   // New York을 append를 사용하여 array 맨 마지막에 추가
print(someCities)
// 출력값) ["Seoul", "New York"]

someCities.insert("Tokyo", at: 1)   // Tokyo를 insert를 사용하여 array index 1번째 자리에 추가
print(someCities)
// 출력값) ["Seoul", "Tokyo", "New York"]

someCities.append(contentsOf: ["Dubai","Sydney"])   // Dubai, Sydney를 append(contentsOf)를 사용하여 맨 마지막에 추가
print(someCities)
// 출력값) ["Seoul", "Tokyo", "New York", "Dubai", "Sydney"]




var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2] // alphabet array에 index 0부터 2까지 들어있는 값 확인
print(alphabet[0...2])
// 출력값) ["a", "b", "c"]

alphabet[2...3] // alphabet array에 index 2부터 3까지 들어있는 값 확인
print(alphabet[2...3])
// 출력값) ["c", "d"]

alphabet[1..<3] // alphabet array의 1부터 3보다 작은 index의 값 확인
print(alphabet[1..<3])
// 출력값) ["b", "c"]

alphabet[1...2] = ["1", "2", "3"]   // alphabet array의 1부터 2까지 index의 새로운 값 할당
print(alphabet)
// 출력값) ["a", "1", "2", "3", "d", "e"]

alphabet[2...4] = ["A"] // alphabet array의 2부터 4까지 index의 새로운 값 할당
print(alphabet)
// 출력값) ["a", "1", "A", "e"]
```
