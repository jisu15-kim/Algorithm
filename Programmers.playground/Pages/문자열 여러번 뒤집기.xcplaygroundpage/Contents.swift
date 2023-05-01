//: [Previous](@previous)

import Foundation

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    
    var resultString = my_string.map { String($0) }
    
    queries.forEach {
        resultString[$0[0]...$0[1]].reverse()
    }
    print(resultString.joined())
    return resultString.joined()
}

solution("rermgorpsam", [[2, 3], [0, 7], [5, 9], [6, 10]])
