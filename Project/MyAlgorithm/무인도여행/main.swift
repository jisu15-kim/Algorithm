//
//  main.swift
//  무인도여행
//
//  Created by 김지수 on 1/1/25.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    
    let newMaps = maps.map { Array(String($0)) }
    var isVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: newMaps[0].count), count: newMaps.count)
    var result = [Int]()
    
    let maxX = maps.count - 1
    let maxY = maps[0].count - 1
    
    func dfs(area: (Int, Int)) -> Int {
        // 위치 초과
        guard area.0 <= maxX && area.0 >= 0 && area.1 <= maxY && area.1 >= 0 else {
            return 0
        }
        // 이미 방문한 경우 종료
        guard !isVisited[area.0][area.1] else {
            return 0
        }
        isVisited[area.0][area.1] = true
        
        // X 인 경우 종료
        guard let count = Int(String(newMaps[area.0][area.1])) else {
            return 0
        }
        
        let x = area.0
        let y = area.1
        
        return dfs(area: (x - 1, y)) + dfs(area: (x + 1, y)) + dfs(area: (x, y - 1)) + dfs(area: (x, y + 1)) + count
    }
    
    for (xIndex, xmap) in newMaps.enumerated() {
        for yIndex in 0 ..< xmap.count {
            if isVisited[xIndex][yIndex] {
                continue
            }
            let sum = dfs(area: (xIndex, yIndex))
            if sum != 0 {
                result.append(sum)
            }
        }
    }
    if result.isEmpty {
        return [-1]
    }
    let resultArr = result.sorted { $0 < $1 }
    return resultArr
}

print(solution(["X591X","X1X5X","X231X", "1XXX1"]))
print(solution(["XXX","XXX","XXX"]))
