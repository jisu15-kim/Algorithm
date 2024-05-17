//
//  main.swift
//  DataStructure
//
//  Created by Jisu Kim on 2023/11/04.
//

import Foundation

//MARK: - Data Structure



//MARK: - BST
//let bst = BinarySearchTree(head: Node(value: 10))
//
//func calculate() {
//    var set = Set<Int>()
//    while set.count != 100 {
//        guard let int = Range(1...1000).randomElement() else { return }
//        set.insert(Int(int))
//    }
//}
//
////MARK: - UpperCase
//func result(scovile: [Int], k: Int) -> Int {
//   let heap = MinHeap(rootValues: scovile)
//   
//   var shakeCount = 0
//   
//   while true {
//      shakeCount += 1
//      let least = heap.pop()!
//      let leastSecond = heap.pop()!
//      let newScovile = least + (leastSecond * 2)
//      if newScovile >= k {
//         break
//      } else {
//         heap.insert(value: newScovile)
//      }
//   }
//   
//   return shakeCount
//}

//MARK: - 팩토리얼 재귀함수
func factorial(_ num: Int) -> Int {
    if num <= 1 {
        return num
    }
    return num * factorial(num - 1)
}

for i in 0...10 {
    print(factorial(i))
}

func 회문인가요(_ word: String) -> Bool {
    // 일단 짝수이면 false
    let charCount = word.count
    if charCount % 2 == 0 {
        return false
    }
    
    let char = Array(word)[0]
}

func 회문체크(count: Int) -> Int {
    if count == 0 {
        return 0
    }
}
