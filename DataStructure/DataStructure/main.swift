//
//  main.swift
//  DataStructure
//
//  Created by Jisu Kim on 2023/11/04.
//

import Foundation

//MARK: - Data Structure



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

//let heap = MinHeap(rootValues: [1])
//print(heap.heapArray)
//print(heap.pop())
//print(heap.heapArray)
