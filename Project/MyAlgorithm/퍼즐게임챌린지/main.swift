//
//  main.swift
//  퍼즐게임챌린지
//
//  Created by 김지수 on 12/26/24.
//

import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    
    func process(currentLevel: Int, index: Int) -> Int {
        let diff = diffs[index] - currentLevel
        
        if diff <= 0 {
            return times[index]
        }
        
        var time = (times[index] + times[index - 1]) * diff
        time += times[index]
        return time
    }
    
    var currentLevel = 1
    var levelTime = 0
    var isNotSolved = true
    
    var maxLevel = 100000
    var minLevel = 1
    
    while isNotSolved {
        let midLevel = (maxLevel + minLevel) / 2
        print("MID LEVEL: \(midLevel)")
        if maxLevel == minLevel {
            print("종료: MidLevel: \(midLevel), CurrentLevel: \(currentLevel)")
            break
        }
        
        currentLevel = midLevel
        levelTime = 0
        
        print("====== MID LEVEL: \(midLevel) =======")
        print("MaxLevel: \(maxLevel), MinLevel: \(minLevel)")
        
        var isSolved = true
        for (index, time) in times.enumerated() {
            let time = process(
                currentLevel: midLevel,
                index: index
            )
            levelTime += time
            
            // 리밋에 걸림
            if levelTime > limit {
                isSolved = false
                break
            } else {
                isSolved = true
            }
        }
        
        if isSolved {
            print("solve 함, MaxLevel: \(midLevel + 1)")
            maxLevel = midLevel + 1
        } else {
            print("리밋에 걸림, minLevel = \(midLevel - 1)")
            minLevel = midLevel - 1
        }
        
    }
    return currentLevel + 1
}

//print(solution([1, 5, 3], [2, 4, 7], 30))
print(solution([1, 4, 4, 2], [6, 3, 8, 2], 59))
//print(solution([1, 328, 467, 209, 54], [2, 7, 1, 4, 3], 1723))
//print(solution([1, 99999, 100000, 99995], [9999, 9001, 9999, 9001], 3456789012))
