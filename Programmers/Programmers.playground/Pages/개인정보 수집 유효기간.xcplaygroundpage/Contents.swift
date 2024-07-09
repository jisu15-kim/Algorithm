//: [Previous](@previous)

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result = [Int]()
    var termsDict = [String: String]()
    terms.forEach { term in
        let arr = term.components(separatedBy: " ")
        termsDict[arr[0]] = arr[1]
    }
    
    var privaciesDict = [String: String]()
    privacies.enumerated().forEach { index, privacy in
        let arr = privacy.components(separatedBy: " ")
        privaciesDict[arr[0]] = arr[1]
        
        var offsetDateArr = arr[0].components(separatedBy: ".")
        var offsetYear = Int(offsetDateArr[0])!
        var offsetMonth = Int(offsetDateArr[1])!
        var offsetDate = Int(offsetDateArr[2])!
        let offset = Int((termsDict[arr[1]]!))!
        print("offsetDateArr: \(offsetDateArr)")
        offsetMonth += offset
        if offsetMonth > 12 {
            let yearOffset = offsetMonth / 12
            offsetMonth %= 12
            offsetYear += yearOffset
            if offsetMonth == 0 {
                offsetMonth = 12
                offsetYear -= 1
            }
        }
        
        var resultDate = [offsetYear, offsetMonth, offsetDate]
            .map { String(format: "%02d", $0) }
            .joined(separator: "")
//        print(resultDate)
        print("resultDate: \(resultDate)")
        let todayInt = Int(today.replacingOccurrences(of: ".", with: ""))!
        print("today: \(todayInt) / target: \(resultDate)")
        if Int(resultDate)! <= todayInt {
            result.append(index + 1)
        }
    }
    return result
}

solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])
solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"])
