//
//  main.swift
//  덧칠하기
//
//  Created by 김지수 on 12/16/24.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    if m == 1 {
        return n
    }
    var sectionDict: [Int: Bool] = [:]
    section.forEach { sectionDict[$0] = true }
    var drawCount = 0

    for i in 1 ... n {
        if sectionDict[i] != nil {
            for j in 0 ..< m {
                if sectionDict[i + j] != nil {
                    sectionDict.removeValue(forKey: i + j)
                }
                if sectionDict.isEmpty {
                    break
                }
            }
            drawCount += 1
            if sectionDict.isEmpty {
                break
            }
        }
    }
    return drawCount
}

print(solution(8, 4, [2, 3, 6]))
print(solution(5, 4, [1, 3]))
print(solution(4, 1, [1, 2, 3, 4]))
