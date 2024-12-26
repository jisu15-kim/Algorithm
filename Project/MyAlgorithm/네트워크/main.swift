//
//  main.swift
//  네트워크
//
//  Created by 김지수 on 12/23/24.
//

import Foundation

var isVisited = [Bool]()

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    isVisited = computers.map { _ in false }
    
    for i in 0 ..< n {
        if isVisited[i] == false {
            result += dfs(index: i, computers: computers)
        }
    }
    
    return result
}

func dfs(index: Int, computers: [[Int]]) -> Int {
    // 종료부
    if isVisited[index] {
        return 0
    }
    
    isVisited[index] = true
    
    // 실행부
    for i in 0 ..< computers[index].count {
        if computers[index][i] == 1 {
            _ = dfs(index: i, computers: computers)
        }
    }
    
    // 결과값
    return 1
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
