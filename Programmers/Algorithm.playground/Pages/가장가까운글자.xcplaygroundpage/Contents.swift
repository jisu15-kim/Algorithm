//: [Previous](@previous)

import Foundation

func solution(_ s:String) -> [Int] {
    
    var result = [Int]()
    var container = [String]()
    
    s.enumerated().forEach { index, char in
        var isMatched = false
        var matchedResult = Int()
        
        if let pre = String(s.prefix(index + 1)).lastIndex(of: char) {
            // 있어
            
        } else {
            // 없어
            result.append(-1)
        }
        
        container.enumerated().forEach { conIndex, conChar in
            if conChar == String(char) {
                isMatched = true
                matchedResult = index - conIndex
            }
        }
        if isMatched {
            result.append(matchedResult)
        } else {
            result.append(-1)
        }
        container.append(String(char))
    }
    return result
}

solution("banana")
solution("foobar")
