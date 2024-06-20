//: [Previous](@previous)

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    var yearningScoreDict = [String: Int]()
    name.enumerated().forEach {
        yearningScoreDict.updateValue(yearning[$0], forKey: $1)
    }
    var resultArray = [Int]()
    photo.forEach { thisPhoto in
        var score = 0
        thisPhoto.forEach { name in
            if let nameScore = yearningScoreDict[name] {
                score += nameScore
            }
        }
        resultArray.append(score)
    }
    return resultArray
}

solution(
    ["may", "kein", "kain", "radi"],
    [5, 10, 1, 3],
    [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]
)
