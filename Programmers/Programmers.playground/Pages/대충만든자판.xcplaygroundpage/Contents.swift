//: [Previous](@previous)

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var keyMapper = [String: Int]()
    
    // keyMapper 만들기
    keymap.enumerated().forEach { index, key in
        let keyArray = Array(key)
        for charIndex in 0 ..< keyArray.count {
            let char = String(keyArray[charIndex])
            
            if let keyValue = keyMapper[char] {
                if (charIndex + 1) < keyValue {
                    keyMapper[char] = charIndex + 1
                }
            } else {
                keyMapper[char] = charIndex + 1
            }
        }
    }
    
    // result 구하기
    var result = [Int]()
    targets.forEach { target in
        var resultValue = 0
        let keyStringArray = Array(target)
        for char in keyStringArray {
            let key = String(char)
            if let value = keyMapper[key] {
                resultValue += value
            } else {
                resultValue = -1
                break
            }
        }
        result.append(resultValue)
    }
    return result
}

solution(["ABACD", "BCEFD"], ["ABCD","AABB"])
solution(["AA"], ["B"])
solution(["AGZ", "BSSS"], ["ASA","BGZ"]
