//: [Previous](@previous)

import Foundation

func solution(_ array:[Int]) -> Int {
    
    var resultArr = [Int: Int]()
    
    for i in array {
        if let value = resultArr[i] {
            resultArr.updateValue(value + 1, forKey: i)
        } else {
            resultArr.updateValue(1, forKey: i)
        }
    }
    var isMultipleMax = false
    var sortedArr = resultArr.sorted { $0.value > $1.value }
    guard let maxValue = sortedArr.first?.value,
          let maxKey = sortedArr.first?.key else { return -1 }
    sortedArr.forEach { dictionary in
        if dictionary.value == maxValue && dictionary.key != maxKey {
            isMultipleMax = true
        }
    }
    return isMultipleMax == true ? -1 : maxKey
}

solution([1, 2, 3, 3, 3, 4])
solution([1, 1, 2, 2])
solution([1])
