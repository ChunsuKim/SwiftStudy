
 # Dictionaries(사전)
 
 축약형 Dictionary
 
 [Key: value] 형태로 Dictionary 를 선언해 사용할 수 있습니다.
 
 
 빈 Dictionary의 생성
 ```swift
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)
// [16: "sixteen"]

namesOfIntegers = [:]
print(namesOfIntegers)
// [:]
```
 literal을 이용한 Dictionary의 생성
 
 [key1: value1, key2: value2, key3: value3] 형태로 dictionary 선언 가능
 
```swift 
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.")
// The airports dictionary contains 2 items.
```
 빈 dictionary 확인
```swift
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// The airports dictionary is not empty.
```
 값 할당
 ```swift
airports["LHR"] = "London"
print(airports)
// ["YYZ": "Toronto Pearson", "LHR": "London", "DUB": "Dublin"]
```
