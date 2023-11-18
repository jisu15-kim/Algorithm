//: [Previous](@previous)

import Foundation

func solution(_ s:String) -> String {
    
    var result = String()
    let offset = Float(s.count) / 2
    let index = offset.truncatingRemainder(dividingBy: 1) == 0 ? offset : offset + 1
    let array = Array(s).map { String($0) }
    result += array[Int(index) - 1]
    if s.count % 2 == 0 {
        result += array[Int(index)]
    }
    return result
}

//1234 56 78910
//123 4 567
//12345
//12 3 45

solution("abcde")
solution("qwer")
