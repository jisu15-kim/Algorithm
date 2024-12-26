//
//  main.swift
//  최소직사각형
//
//  Created by 김지수 on 12/24/24.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxWidth = 0
    var maxHeight = 0
    
    for size in sizes {
        var size = size
        if size[0] < size[1] {
            size = [size[1], size[0]]
        }
        
        if maxWidth < size[0] {
            maxWidth = size[0]
        }
        
        if maxHeight < size[1] {
            maxHeight = size[1]
        }
    }
    
    return maxWidth * maxHeight
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]))
print(solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]))
