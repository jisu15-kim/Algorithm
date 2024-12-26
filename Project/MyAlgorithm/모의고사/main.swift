//
//  main.swift
//  모의고사
//
//  Created by 김지수 on 12/24/24.
//

import Foundation

func getFirstAnswer(index: Int) -> Int {
    return (index % 5) + 1
}

func getSecondAnswer(index: Int) -> Int {
    if index % 2 == 0 {
        return 2
    } else {
        let result = index % 8
        switch result {
        case 1: return 1
        case 3: return 3
        case 5: return 4
        case 7: return 5
        default: break
        }
        return 0
    }
}

func getthirdAnswer(index: Int) -> Int {
    let thirdResult = index % 10
    switch thirdResult {
    case 0, 1: return 3
    case 2, 3: return 1
    case 4, 5: return 2
    case 6, 7: return 4
    case 8, 9: return 5
    default: break
    }
    return 0
}

func solution(_ answers:[Int]) -> [Int] {
    var resultDict : [Int : Int] = [1: 0, 2: 0, 3: 0]
    
    answers.enumerated().forEach { index, answer in
        let firstAnswer = getFirstAnswer(index: index)
        let secondAnswer = getSecondAnswer(index: index)
        let thirdAnswer = getthirdAnswer(index: index)
        
        if firstAnswer == answer {
            resultDict[1]! += 1
        }
        
        if secondAnswer == answer {
            resultDict[2]! += 1
        }
        
        if thirdAnswer == answer {
            resultDict[3]! += 1
        }
    }
    let sortedResult = resultDict.sorted { $0.value > $1.value }
    
    var resultArray : [Int] = []
    var maxValue = 0
    for result in sortedResult {
        if result.value >= maxValue {
            maxValue = result.value
            resultArray.append(result.key)
        } else {
            break
        }
    }
    resultArray.sort { $0 < $1 }
    return resultArray
}

print(solution([1,2,3,4,5,2,3,4,5,2,3,4,5]))
print(solution([1,3,2,4,2]))
print(solution([1,2,3,4,5]))
