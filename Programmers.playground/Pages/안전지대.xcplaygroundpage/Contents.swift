//: [Previous](@previous)

import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    var resultArray: [[Int]] = .init()
    let range: [[Int]] = [[-1, -1], [-1, 0], [-1, 1],
                          [0, -1], [0, 0], [0, 1],
                          [1, -1], [1, 0], [1, 1]]
    
    for _ in 1...board.count {
        var array: [Int] = []
        for _ in 1...board.count {
            array.append(0)
        }
        resultArray.append(array)
    }
    
    board.enumerated().forEach { firstIndex, array in
        array.enumerated().forEach { secondIndex, element in
            if element == 1 {
                range.forEach { range in
                    let first = firstIndex + range[0]
                    let second = secondIndex + range[1]
                    if first < board.count && second < board.count && first >= 0 && second >= 0 {
                        print("range: \(range)")
                        print("First: \(firstIndex + range[0]), Second: \(secondIndex + range[1])")
                        print("---")
                        resultArray[firstIndex + range[0]][secondIndex + range[1]] += 1
                    }
                }
            }
        }
    }
    
    var resultCount = 0
    resultArray.forEach { array in
        print(array)
        array.forEach { result in
            if result == 0 { resultCount += 1 }
        }
    }
    return resultCount
}

solution([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]])
solution([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 1, 0], [0, 0, 0, 0, 0]])
solution([[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]])
