//
//  main.swift
//  귤고르기
//
//  Created by 김지수 on 12/18/24.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var dict: [Int: Int] = [:]
    tangerine.forEach {
        if dict[$0] == nil {
            dict[$0] = 1
        } else {
            dict[$0]! += 1
        }
    }
    let sorted = dict
        .filter { $0.key <= k }
        .sorted(by: { $0.key > $1.key })
    
    print(sorted)
    
    for i in 0 ..< sorted.count {
        var offset = k
        var resultCount = 0
        for j in i ..< sorted.count {
            let value = sorted[j].value
            offset -= value
            if offset >= 0 {
                resultCount += 1
            }
            if offset == 0 {
                return resultCount
            }
            if offset < 0 {
                offset = k
                resultCount = 0
            }
        }
    }
    return 0
}


print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
print(solution(4, [1, 3, 2, 5, 4, 5, 2, 3]))
print(solution(2, [1, 1, 1, 1, 2, 2, 2, 3]))
