//: [Previous](@previous)

import Foundation

func solution(_ common:[Int]) -> Int {
    var isArtimetic = true
    
    let lastIndex = common.count - 1
    
    // 1. 등차수열
    if common[lastIndex] - common[lastIndex - 1] == common[lastIndex - 1] - common[lastIndex - 2] {
        isArtimetic = true
    } else {
        // 2. 등비수열
        isArtimetic = false
    }
    
    switch isArtimetic {
    case true:
        let offset = common[lastIndex] - common[lastIndex - 1]
        return common[lastIndex] + offset
    case false:
        let offset = common[lastIndex] / common[lastIndex - 1]
        return common[lastIndex] * offset
    }
}

solution([1, 2, 3, 4])
solution([2, 4, 8])
solution([2, 4, 6, 8])
