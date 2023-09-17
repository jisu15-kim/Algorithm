import UIKit

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    var idDict = [String: Set<String>]()
    id_list.forEach { idDict[$0] = [] }
    
    report.forEach { rowLog in
        let log = rowLog.components(separatedBy: " ")
        if let user = log.first,
           let target = log.last,
           var result = idDict[target] {
            result.insert(user)
            idDict[target] = result
        }
    }
    
    var thresholdedList = [String]()
    
    id_list.forEach {
        if let list = idDict[$0], list.count >= k {
            thresholdedList.append(contentsOf: Array(list))
        }
    }
    
    var mailCount = [String: Int]()
    id_list.forEach { mailCount[$0] = 0 }
    thresholdedList.forEach {
        if let count = mailCount[$0] {
            mailCount[$0] = count + 1
        }
    }
    
    var result = [Int]()
    id_list.forEach {
        if let count = mailCount[$0] {
            result.append(count)
        }
    }
    
    return result
}

solution(["muzi",
          "frodo",
          "apeach",
          "neo"],
         ["muzi frodo"
          ,"apeach frodo"
          ,"frodo neo"
          ,"muzi neo"
          ,"apeach muzi"
         ]
         , 2)

solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3)
