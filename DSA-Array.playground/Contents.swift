import UIKit

var strings = ["a", "b", "c", "d"]
//4 * 4 = 16 bytes of storage

strings[2]

//push
strings.append("e") // O(1)


//pop
strings.popLast()
print(strings)
strings.popLast() // O(1) -> We are not looping through items


//Insert
strings.insert("x", at: 0) //O(n) we have to line the indexes.
print(strings)

//Insert into middle of the array
strings.insert("Aliece", at: strings.count / 2) // O(n)
print(strings)



print(":")



