//: [Previous](@previous)

import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    
    var resultArray = [Int]()
    
    for i in l...r {
        var resultCount = 0
        let numString = String(i)
        let numCount = numString.count
        
        for c in 0...numCount - 1 {
            let index = numString.index(numString.startIndex, offsetBy: c)
            if numString[index] == "0" || numString[index] == "5" { resultCount += 1 }
        }
        if resultCount == numCount { resultArray.append(i) }
        
    }
    return resultArray.isEmpty ? [-1] : resultArray
}

solution(5, 555)
solution(10, 20)
