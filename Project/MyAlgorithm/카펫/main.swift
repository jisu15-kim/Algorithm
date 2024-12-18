//
//  main.swift
//  카펫
//
//  Created by 김지수 on 12/18/24.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    if yellow == 1 {
        return [3, 3]
    }
    var maxResult = 0
    var resultArray = [Int]()
    for number in 0 ..< yellow / 2 {
        let number = number + 1
        if yellow % number == 0 {
            let bigger = yellow / number
            let smaller = number
            let totalArea = (bigger + 2) * (smaller + 2)
            if (totalArea - yellow) == brown {
                if totalArea > maxResult {
                    maxResult = totalArea
                    resultArray = [bigger + 2, smaller + 2]
                    break
                }
            }
        }
    }
    
    return resultArray
}

print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))
