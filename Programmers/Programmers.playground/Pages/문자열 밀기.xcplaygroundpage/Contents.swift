//: [Previous](@previous)

import Foundation

func solution(_ A:String, _ B:String) -> Int {
    
    var resultCount = 0
    var resultString = A
    var isMatch = false
    
    for _ in 0...A.count - 1 {
        if resultString == B {
            isMatch = true
            break
        }

        var string = resultString
        if let lastString = resultString.last {
            string.removeLast()
            string.insert(lastString, at: string.startIndex)
            resultCount += 1
            resultString = string
        }
    }
    
    return isMatch ? resultCount : -1
}


solution("hello", "ohell")
solution("apple", "elppa")
solution("atat", "tata")
solution("abc", "abc")
