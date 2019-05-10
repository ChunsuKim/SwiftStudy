
 # Set(집합)
 
 set 형태로 저장되기 위해서는 반드시 hashable type이어야함.
 hashable type: String, Int, Double, Bool 같은 기본타입

```swift 
/* 빈 set 생성 */
var letters = Set<Character>()
print("letters is of tyepe Set<Character> with \(letters.count) items.")
// letters is of tyepe Set<Character> with 0 items.

letters.insert("a")
print(letters)
// ["a"]
letters = []
print(letters)
// []

/* 배열 literal을 이용한 set 생성 */
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"] // 타입 추론에 의해 단축가능

/* set의 접근과 변경 */
print("I have \(favoriteGenres.count) favorite music genres.")
// I have 3 favorite music genres.

/* 비었는지 확인 */
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// I have particular music preferences.

/* 추가 */
favoriteGenres.insert("Jazz")
print(favoriteGenres)
// ["Hip hop", "Jazz", "Classical", "Rock"]

/* 삭제 */
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Rock? I'm over it.

/* 값 확인 */
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// It's too funky in here.

/* set의 순회 */
for genre in favoriteGenres {
    print("\(genre)")
}
// Hip hop
// Classical
// Jazz

/* set 명령 */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.intersection(evenDigits).sorted()
// []

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

/*
 set의 membership과 동등비교
 
 set의 동등비교와 맴버 여부를 확인하기 위해 각각 == 연산자와
 
 isSuperset(of:),
 
 isStrictSubset(of:),
 
 isStrictSuperset(of:),
 
 isDisjoint(with:) method를 사용
 
 isDisjoint(with:)는 둘간의 공통값이 없는 경우에 참을 반환
 */

let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
let cityAnimals: Set = ["bird", "mouse"]

houseAnimals.isSubset(of: farmAnimals)
// true

farmAnimals.isSuperset(of: houseAnimals)
// true

farmAnimals.isDisjoint(with: cityAnimals)
// true
```
