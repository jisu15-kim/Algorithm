//
//  main.swift
//  DataStructure
//
//  Created by Jisu Kim on 2023/11/04.
//

import Foundation

//MARK: - Data Structure

//MARK: Hash Table
struct MyHashTable {
    var hashTable = Array<[Any]?>(repeating: nil, count: 10000)
    
    func hashFunction(key: String) -> UInt8 {
        let key = key.first!.asciiValue!
        return key % 8
    }
    
    mutating func setValue(key: String, value: Any) {
        let hashKey = hashFunction(key: key)
        print("HashKey: \(hashKey)")
        // 데이터가 있다
        if hashTable[Int(hashKey)] != nil {
            hashTable[Int(hashKey)]?.append(key)
            hashTable[Int(hashKey)]?.append(value)
        } else {
            // 데이터가 없다
            hashTable[Int(hashKey)] = [key, value]
        }
    }
    
    func getValue(key: String) -> Any? {
        let hashKey = hashFunction(key: key)
        
        if let valueArray = hashTable[Int(hashKey)] {
            // 데이터가 있다
            var matchedIndex: Int?
            var matchedValue: Any?
            valueArray.enumerated().forEach { index, value in
                if let valueKey = value as? String,
                   valueKey == key  {
                    matchedIndex = index + 1
                }
                
                if matchedIndex == index {
                    matchedValue = value
                }
            }
            return matchedValue
        } else {
            // 데이터가 없다
            return nil
        }
    }
}

//MARK: - HashFunction
/// 전통적인 가장 간단한 방식은 Division 법 (나누기를 통한 나머지 값을 사용하는 방법)


//let data1 = "Andy"
//let data2 = "Dave"
//let data3 = "Trump"
//
//var hashTable = MyHashTable()
//hashTable.setValue(key: "Andy", value: "010-4602-2752")
//hashTable.setValue(key: "Andrew", value: "010-2698-3967")
//hashTable.setValue(key: "jisu", value: "전화번호 없음")
//hashTable.setValue(key: "jason", value: "해시브라운")
//hashTable.setValue(key: "yeonjae", value: "번호 만들 예정")
//
//print(hashTable.getValue(key: "Andy"))
//print(hashTable.getValue(key: "Andrew"))
//print(hashTable.getValue(key: "jisu"))
//print(hashTable.getValue(key: "jason"))
//print(hashTable.getValue(key: "yeonjae"))
//


//MARK: - BST
let bst = BinarySearchTree(head: Node(value: 10))

func calculate() {
    var set = Set<Int>()
    while set.count != 100 {
        guard let int = Range(1...1000).randomElement() else { return }
        set.insert(Int(int))
    }
}

//MARK: - UpperCase
func result(scovile: [Int], k: Int) -> Int {
   let heap = MinHeap(rootValues: scovile)
   
   var shakeCount = 0
   
   while true {
      shakeCount += 1
      let least = heap.pop()!
      let leastSecond = heap.pop()!
      let newScovile = least + (leastSecond * 2)
      if newScovile >= k {
         break
      } else {
         heap.insert(value: newScovile)
      }
   }
   
   return shakeCount
}

//print("👉결과: \(result(scovile: [1], k: 7))")

let heap = MinHeap(rootValues: [1])
print(heap.heapArray)
print(heap.pop())
print(heap.heapArray)


