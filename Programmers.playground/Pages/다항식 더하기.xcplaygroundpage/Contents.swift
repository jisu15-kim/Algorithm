//: [Previous](@previous)

import Foundation

//func solution(_ polynomial:String) -> String {
//
//    let elements = polynomial.split(separator: " ", omittingEmptySubsequences: false).map { String($0) }
//
//    var varResult: Int = 0
//    var numResult: Int = 0
//
//    elements.enumerated().forEach { index, string in
//        if index % 2 == 0 {
//            if let number = Int(string) {
//                numResult += number
//            } else {
//                if let first = Int(string.prefix(1)) {
//                    varResult += first
//                } else {
//                    varResult += 1
//                }
//            }
//        }
//    }
//
//    var result = ""
//
//    if varResult > 0 {
//        result.append("\(varResult)x")
//    }
//    if numResult > 0 {
//        if varResult == 0 {
//            result.append("\(numResult)")
//        } else {
//            result.append(" + \(numResult)")
//        }
//    }
//    print(result)
//    return result
//}

func solution(_ polynomial: String) -> String {
    var answer = ""
    let arr = polynomial.components(separatedBy: " + ")
    var x = 0
    var num = 0

    for s in arr {
        if s == "x" {
            x += 1
        } else if s.contains("x") {
            if let coefficient = Int(s.dropLast()) {
                x += coefficient
            }
        } else {
            if let constant = Int(s) {
                num += constant
            }
        }
    }

    if x != 0 && num == 0 {
        if x == 1 {
            answer = "x"
        } else {
            answer = "\(x)x"
        }
    }

    if x != 0 && num != 0 {
        if x == 1 {
            answer = "x + \(num)"
        } else {
            answer = "\(x)x + \(num)"
        }
    }

    if x == 0 && num != 0 {
        answer = "\(num)"
    }
    return answer
}

solution("8x + 7 + x + 15 + 7x")
