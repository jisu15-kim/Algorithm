//: [Previous](@previous)

import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    
    var resultArr = [Int]()
    var index = total
    
    if total == 0 {
        resultArr = [-1, 0, 1]
        return resultArr
    }
    
    for value in stride(from: total, to: -total, by: -1) {
        if resultArr.count == num {
            resultArr.remove(at: 0)
        }
        resultArr.append(value)
        var sum = 0
        resultArr.forEach { sum += $0 }
        if sum == total && resultArr.count == num {
            resultArr.sort { $0 < $1 }
            break
        }
    }
    return resultArr
}

solution(3, 12)
solution(5, 15)
solution(4, 14)
solution(5, 5)
solution(3, 0)
solution(1, 5)
