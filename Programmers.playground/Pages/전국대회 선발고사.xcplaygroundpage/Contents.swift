//: [Previous](@previous)

import Foundation

func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    /// Key - 점수, Value - Index
    /// 점수 : Index
    var dictionary = [Int: Int]()
    attendance.enumerated().forEach { index, isAttendce in
        if isAttendce == true {
            dictionary.updateValue(index, forKey: rank[index])
        }
    }
    let sortedDictionary = dictionary
        .sorted { $0.key < $1.key }
        .map { $0.value }
    return sortedDictionary[0] * 10000 + sortedDictionary[1] * 100 + sortedDictionary[2]
}

solution([3, 7, 2, 5, 4, 6, 1], [false, true, true, true, true, false, false])
solution([1, 2, 3], [true, true, true])
solution([6, 1, 5, 2, 3, 4], [true, false, true, false, false, true])
