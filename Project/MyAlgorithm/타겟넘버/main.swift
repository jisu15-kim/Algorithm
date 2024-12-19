//
//  main.swift
//  타겟넘버
//
//  Created by 김지수 on 12/20/24.
//

import Foundation


func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs(index: Int, sum: Int) {
        // 탈출
        if index == numbers.count {
            if sum == target {
                result += 1
            }
            
            return
        }
        // 실행문
        dfs(
            index: index + 1,
            sum: sum + numbers[index]
        )
        dfs(
            index: index + 1,
            sum: sum - numbers[index]
        )
    }
    
    dfs(index: 0, sum: 0)
    
    return result
}

print(solution([1, 1, 1, 1, 1], 3))
print(solution([4, 1, 2, 1], 4))
