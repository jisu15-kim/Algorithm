//: [Previous](@previous)

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    absolutes.enumerated().forEach {
        let offset = signs[$0] ? 1 : -1
        result += $1 * offset
    }
    return result
}

solution([4,7,12], [true,false,true])
