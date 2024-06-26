import UIKit

var strings = ["a", "b", "c", "d"]
//4 * 4 = 16 bytes of storage

strings[2]

//push
strings.append("e") // O(1)


//pop
strings.popLast()
//print(strings)
strings.popLast() // O(1) -> We are not looping through items


//Insert
strings.insert("x", at: 0) //O(n) we have to line the indexes.
//print(strings)

//Insert into middle of the array
strings.insert("Aliece", at: strings.count / 2) // O(n)
//print(strings)




//Reverse Strings

var name = "Hi My name is Gihan"
var nameArray = [Character]()

func revers(name: String) -> String {
    //check input
    if name.isEmpty || name.count < 2 {
        return "Hmm thats not good"
    }

    var backwardsArray = [Character]()
    for items in name.reversed() {
        backwardsArray.append(items)
    }

    return String(backwardsArray)

}

//In build function
func revers2(name: String) -> String {

    return String(name.reversed())
}


//print(revers(name: name))
//print(revers2(name: name))


//Reverse an Array

let a = [6,6,7,6, 3,2,1,6, 4,0,6,3, 8,3,7,3, 4,2,3, 5,8,6, 8,8,5,0, 6,7,6,2]

func reverseArray(a: [Int]) -> [Int] {
    var reverse = [Int]()
    for items in a.reversed() {
        reverse.append(items)
    }

    return reverse
}

//print(reverseArray(a: a))

//Move Zeros
var numssd = [0,1,0,3,12]
func moveZeroes(_ nums: inout [Int]) {
    var left = 0

    for i  in 0..<nums.count {

        if nums[i] != 0 {
            (nums[left], nums[i]) = (nums[i], nums[left])
            left += 1
        }
    }


}

//func twoSum3(_ array: [Int], _ target: Int) -> [Int] {
//    var dic = [Int : Int]()
//
//    for (k,v) in array.enumerated() {
//        var dif = target - v
//        if let value = dic[dif] {
//            print(value)
//            return [value, k]
//        }
//
//        dic[v] = k
//    }
//
//    return []
//}
//
//twoSum3([2,0,3,7], 9)

moveZeroes(&numssd)






//MARK: -MERGE SORT ARRAY


func mergeSortedArrays(_ array1:[Int], _ array2:[Int]) -> [Int] {
    var mergedArray = [Int]()

    if array1.count == 0 {
        return array2
    }
    if array2.count == 0 {
        return array1
    }

    var array1IteratorValue:Int? = array1[0]
    var array2IteratorValue:Int? = array2[0]
    var i = 1
    var j = 1
    while (array1IteratorValue != nil) || (array2IteratorValue != nil) {
        if array1IteratorValue == nil {
            mergedArray.append(array2IteratorValue!)
            if j < array2.count {
                array2IteratorValue = array2[j]
                j += 1
            } else {
                array2IteratorValue = nil
            }
            continue
        }
        if array2IteratorValue == nil {
            mergedArray.append(array1IteratorValue!)
            if i < array1.count {
                array1IteratorValue = array1[i]
                i += 1
            } else {
                array1IteratorValue = nil
            }
            continue
        }
        if array1IteratorValue! <= array2IteratorValue! {
            mergedArray.append(array1IteratorValue!)
            if i < array1.count {
                array1IteratorValue = array1[i]
                i += 1
            } else {
                array1IteratorValue = nil
            }
        } else {
            mergedArray.append(array2IteratorValue!)
            if j < array2.count {
                array2IteratorValue = array2[j]
                j += 1
            } else {
                array2IteratorValue = nil
            }
        }
    }
    return mergedArray
}

//print(mergeSortedArrays([0, 3, 10, 15, 20], [1, 5, 12, 19, 25, 30, 50]))



func containsDuplicate(_ nums: [Int]) -> Bool {
    var hashSet = Set<Int>()

    for n in nums {
        if hashSet.contains(n) {
            return true
        }
        hashSet.insert(n)

    }

    return false
}

var nums = [0,0,1,1,1,2,2,3,3,4]

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var l = 1

    for r in 1..<nums.count {

        if nums[r] != nums[r - 1] {
            nums[l] = nums[r]
            l += 1
            print(l)

        }
    }

    return l

}

//removeDuplicates(&nums)

containsDuplicate([0, 3, 10, 15, 20, 3])

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hasMap = [Int : Int]()// Empty dictionary
    var resultArray = [Int]()
    for (key, value) in nums.enumerated() {
        var difference = target - value
        if let keyItem = hasMap[difference] {
            resultArray = [keyItem, key]
            break


        }

        hasMap[value] = key




    }

    return resultArray

}

//twoSum([2,11,15,7], 9)

//Move Zeros
var numss = [3,2,2,3]

var s = "Hello World"

func lengthOfLastWord(_ s: String) -> Int {

    if s.isEmpty {
        return 0
    }

    let sd = Array(s)
    var length = s.count
    var lastWord = 0

    while length > 0 && sd[length - 1] == " " {
        length -= 1
        print("hi")
    }

    while length > 0 && sd[length - 1] != " " {
        lastWord += 1
        length -= 1
    }
    print(sd)
    return lastWord

}

lengthOfLastWord(s)

var snums = [3,2,2,3]

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var k = 0
    for i in nums {
        print(i)
        if i != val {

            nums[k] = i

            k += 1

        }




    }
    print(nums)
    return k
}

let removedCount = removeElement(&snums, 3)

func romanToInt(_ s: String) -> Int {
    var roma: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L":50, "C": 100, "D": 500, "M": 1000]
    var sum = 0

    let characterArray = Array(s)
    for i in 0..<characterArray.count {

        guard let currentValue = roma[characterArray[i]] else { return 0 }
        let nextValue = i < characterArray.count - 1 ? roma[characterArray[i + 1]] : 0

        if currentValue < nextValue! {
            sum -= currentValue
        } else {
            sum += currentValue
        }

    }
    print(sum)
    return sum
}

romanToInt("CMXCVIII")

func majorityElement(_ nums: [Int]) -> Int {
    var res = 0
    var count = 0

    for n in nums {
        if count == 0 {
            res = n
        }

        count += n == res ? 1 : -1
    }

    return res



}

majorityElement([3,2,3])


var prices = [7,1,5,3,6,4]

func maxProfit(_ prices: [Int]) -> Int {
    var maxPrice = 0
    var minPrice = Int.max

    for price in prices {
        minPrice = min(minPrice, price)
        var profit = price - minPrice
        maxPrice = max(maxPrice, profit)
    }

    return maxPrice


}

maxProfit(prices)



func longestCommonPrefix(_ strs: [String]) -> String {

    guard !strs.isEmpty else { return ""}

    var prefix = strs.first!

    for str in strs[1...] {
        while !str.hasPrefix(prefix) {
            prefix = String(prefix.prefix(prefix.count - 1))
            print(prefix)
            if prefix.isEmpty { return "" }
        }
    }

    return prefix

}

longestCommonPrefix(["flower","flow","flight"])


print("------- New one ------")



func removeDuplicates2(_ nums: inout [Int]) -> Int {
    var leftPointer = 0
    var rightPointer = 0

    while rightPointer < nums.count {
        var count = 1

        while rightPointer + 1 < nums.count && nums[rightPointer] == nums[rightPointer + 1] {
            rightPointer += 1
            count += 1
        }

        for i in 0..<min(2, count) {
            nums[leftPointer] = nums[rightPointer]
            leftPointer += 1
        }

        rightPointer += 1
    }

    return leftPointer

}

func rotate(_ nums: inout [Int], _ k: Int) {
    var nItems = nums.count
    var k = k % nItems
    var targetSlice = nums[nItems - k..<nItems] + nums[0..<nItems - k]
    nums = Array(targetSlice)
    print(nums)

}

var ddd = [1,2,3,4,5,6,7]

rotate(&ddd, 2)


//Best time to buy and sell 2
func maxProfit2(_ prices: [Int]) -> Int {
    var profit = 0

    for price in 1..<prices.count {
        if prices[price] > prices[price - 1] {
            profit += prices[price] - prices[price - 1]
        }
    }

    return profit

}

maxProfit2([7,1,5,3,6,4])


func getConcatenation(_ nums: [Int]) -> [Int] {

    return nums + nums

}


getConcatenation([1,2,1])


//-----Find the index of the first occurence in a String ----

func strStr(_ haystack: String, _ needle: String) -> Int {
    var haystackArray = Array(haystack)
    var needleArray = Array(needle)

    if needleArray.count > haystackArray.count { return -1 }

    for startIndex in 0..<haystackArray.count {
        if startIndex + needleArray.count > haystackArray.count {
            return -1
        }

        var j = 0
        while j < needleArray.count && haystackArray[startIndex + j] == needleArray[j] {
            j += 1
        }

        if j == needleArray.count {
            return startIndex
        }
    }
    return -1

}

strStr("sadbutsad", "sad")



func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

    var charCounts: [Character: Int] = [:]
    for char in magazine {
        charCounts[char, default: 0] += 1
    }

    print(charCounts)
    for char in ransomNote {
        if charCounts[char, default: 0] == 0 {
            print(charCounts[char, default: 0])
            return false
        }
        print(charCounts[char])
        charCounts[char]! -= 1
    }

    return true
}

canConstruct("aaaaaa", "bbbaaaa")


print("------- Isomorphic Strings ------")
//

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var map = [Character: Character]()
    for i in s.indices {
        if let value = map[s[i]] {
            guard value == t[i] else {
                return false
            }
        }
        else if map.values.contains(t[i]) {
            return false
        }
        else {
            map[s[i]] = t[i]
        }
    }
    return true


}

isIsomorphic("foo", "bar")
