
 # 컬렉션 타입 (Collection Types)
 
 Swift 에서는 주된 컬렉션 타입으로 Array(배열), Set(집합), Dictionary(사전) 세 가지를 지원합니다.
 
 
 ## 컬렉션의 변경
 
 Array, Set, Dictionary 를 변수(var)에 할당하면 이 컬렉션은 변경가능하고, 상수(let)에 할당하면 변경 불가능 합니다.
 
 
 ## Array(배열)
 
 ### 배열의 축약형 문법
 
 배열 타입은 Array로 적을 수 있는데 축약형으로 [Element] 형태로 사용할 수도 있습니다.
 
 
 ### 빈 배열의 생성
 
 아래와 같이 Int형 빈 배열을 생성할 수 있습니다.
 
```swift
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
// 배열에 3을 추가 했습니다.
someInts = []
// 배열을 비웠습니다. 배열의 아이템 타입은 그대로 Int로 유지됩니다.
```

 ### 기본 값으로 빈 배열 생성
 
 repeating 메소드와 count 메소드를 이용해 기본 값으로 빈 배열을 생성할 수 있습니다.
 
```swift
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles: Double 타입의 [0.0, 0.0, 0.0]
```

 ### 다른 배열을 추가한 배열의 생성
 
 "+" 연산자를 이용해 배열을 합칠 수 있습니다.
 
```swift
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles: [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles: [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```

 ### 문자형(Literal)을 이용한 배열의 생성
 
 [value 1, value 2, value 3] 형태를 이용해 배열을 생성할 수 있습니다.
 
```swift
var shoppingList: [String] = ["Eggs", "Milk"]
```

 더 간단하게 선언할 수도 있습니다.
 ```swift
 var shoppingList = ["Eggs", "Milk"]
 ```
 
 ### 배열의 접근 및 변환
 
```swift
print("The shopping list contains \(shoppingList.count) items.")
// The shopping list contains 2 items.

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// The shopping list is not empty.
```
 ### 배열의 끝에 아이템 추가하기
```swift
shoppingList.append("Four")
// ["Eggs", "Milk", "Four"]

shoppingList += ["Baking Powder"]
// ["Eggs", "Milk", "Four", "Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// ["Eggs", "Milk", "Four", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
// firstItem: Eggs

shoppingList[4...6] = ["Bananas", "Apples"]
// 4, 5, 6번째 Index items "Bananas", "Apples"로 변환
// 즉, 아이템 3개가 2개로 줄었다.
// ["Eggs", "Milk", "Four", "Baking Powder", "Bananas", "Apples"]

shoppingList.insert("Maple Syrup", at: 0)
// ["Maple Syrup", "Eggs", "Milk", "Four", "Baking Powder", "Bananas", "Apples"]

let mapleSyrup = shoppingList.remove(at: 0)
// index의 0번째 아이템 삭제 "Maple Syrup"
// ["Eggs", "Milk", "Four", "Baking Powder", "Bananas", "Apples"]

firstItem = shoppingList[0]
// Eggs

let apples = shoppingList.removeLast()
// index의 마지막 아이템 삭제 "Apples"
// ["Eggs", "Milk", "Four", "Baking Powder", "Bananas"]
```

 ### 배열의 순회
 
 for-in loop를 이용하여 배열을 순회할 수 있습니다.
 
```swift
for item in shoppingList {
    print(item)
}
// Eggs
// Milk
// Four
// Baking Powder
// Bananas
```
 배열의 값과 인덱스가 필요할 때는 enumerated() 메소드를 사용합니다.
```swift
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
//Item 1: Eggs
//Item 2: Milk
//Item 3: Four
//Item 4: Baking Powder
//Item 5: Bananas
```
