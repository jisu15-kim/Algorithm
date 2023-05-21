//: [Previous](@previous)

import Foundation

func solution(_ quiz:[String]) -> [String] {
    
    var resultArray: [String] = []
    
    quiz.forEach { quiz in
        var isCorrectResult = ""
        let elements = quiz.split(separator: " ", omittingEmptySubsequences: true)
        let first = Int(elements[0])!
        let second = Int(elements[2])!
        let result = Int(elements[4])!
        
        if elements[1] == "+" {
            isCorrectResult = first + second == result ? "O" : "X"
        } else {
            isCorrectResult = first - second == result ? "O" : "X"
        }
        resultArray.append(isCorrectResult)
    }
    return resultArray
}

solution(["3 - 4 = -3", "5 + 6 = 11"])
