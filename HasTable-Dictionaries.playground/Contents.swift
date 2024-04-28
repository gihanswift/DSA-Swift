import UIKit

class HashElement<T: Hashable, U> {
    var key: T
    var value: U?

    init(key: T, value: U) {
        self.key = key
        self.value = value
    }
}

struct HashTable<Key: Hashable, Value> {

    typealias Bucket = [HashElement<Key, Value>]

    var buckets: [Bucket]

    init(capatcity: Int) {
        assert(capatcity > 0)
        buckets = Array<Bucket>(repeating: [], count: capatcity)
    }

    func index(for key: Key) -> Int {
        let hashValue = key.hashValue
        return abs(hashValue % buckets.count)
    }

    func retriveValue(for key: Key) -> Value? {
        let index = self.index(for: key)
        for value in self.buckets[index] {
            if value.key == key {
                return value.value
            }
        }

        return nil
    }

    @discardableResult
    mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        var itemIndex = self.index(for: key)
        for (i, element) in buckets[itemIndex].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[itemIndex][i].value = value
                return oldValue
            }
        }
        buckets[itemIndex].append(HashElement(key: key, value: value))
        return nil
    }

    @discardableResult
    mutating func removeValue(for key: Key) -> Value? {
        let index = self.index(for: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                return element.value
            }
        }
        return nil
    }


    subscript(key: Key) -> Value? {
        get {
            return retriveValue(for: key)
        }

        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(for: key)
            }
        }
    }
}

var hasha = HashTable<String, Any>(capatcity: 50)
hasha.updateValue(100, forKey: "grapes")
hasha.updateValue(200000, forKey: "Apple")
for bucket in hasha.buckets {
    for eachBucketData in bucket {
        print(eachBucketData.key)
    }
}
hasha.retriveValue(for: "grapes")

//First recurring character

var array = [2,5,5,2,3,5,1,2,4]

func firstRecuringNumber(_ nums : [Int]) -> Int {
    var mostRecurringNumber = 0
    var dic : [Int : Int] = [:]
    for (key, value) in nums.enumerated() {
        if dic.values.contains(value) {
            mostRecurringNumber = value
            break
        }

        dic.updateValue(value, forKey: key)
    }

    return mostRecurringNumber
}

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

firstRecuringNumber(array)

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    var mapCharToWord: [String : String ] = [:]
    var wordToChar: [String : String ] = [:]
    var patternArray = Array(pattern)
    var words = s.components(separatedBy: " ")


    if pattern.count != words.count {
        return false
    }

    for (c, w )in zip(patternArray, words) {
        if mapCharToWord[String(c)] != nil && mapCharToWord[String(c)] != w {
            return false

        }

        if wordToChar[w] != nil && wordToChar[w] != String(c) {
            return false

        }
        mapCharToWord[String(c)] = w
        wordToChar[w] = String(c)


    }

    return true



}

wordPattern("abba", "dog cat cat fish")

func isAnagram(_ s: String, _ t: String) -> Bool {
    var mapS: [Character : Int] = [:]
    var mapT: [Character? : Int] = [:]


    if s.count != t.count {
        return false
    }

    for charS in s {
        mapS[charS, default: 0] += 1
    }

    for charT in t {
        mapT[charT, default: 0] += 1
    }

    return mapS == mapT


}

isAnagram("ad", "cv")



func groupAnagrams(_ strs: [String]) -> [[String]] {

    var dict: [String : [String]] = [:]

    for str in strs {
        let sorted = String(str.sorted())
        print(dict[sorted])
        dict[sorted, default: []].append(str)
    }
    print(Array(dict.values))
    return Array(dict.values)
    }

groupAnagrams(["eat","tea","tan","ate","nat","bat"])
