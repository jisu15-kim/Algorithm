//
//  main.swift
//  체육복
//
//  Created by 김지수 on 12/30/24.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostArray = Set(lost).subtracting(reserve).sorted(by: <)
    let reserveArray = Set(reserve).subtracting(lost).sorted(by: <)
    
    
    
    for num in reserveArray {
        if let index = lostArray.firstIndex(of: num - 1) {
            lostArray.remove(at: index)
            continue
        }
        
        if let index = lostArray.firstIndex(of: num + 1) {
            lostArray.remove(at: index)
            continue
        }
    }
    return n - lostArray.count
}


print(solution(5, [2, 4], [1, 3, 5]))
print(solution(5, [2, 4], [3]))
print(solution(3, [3], [1]))
print(solution(5, [5, 3], [4, 2]))
