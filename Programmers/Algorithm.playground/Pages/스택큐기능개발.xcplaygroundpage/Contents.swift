import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var newSpeeds = speeds
    var newProgresses = progresses
    var removeCountArray = [Int]()
    
    while !newProgresses.isEmpty {
        newProgresses.enumerated().forEach { inIndex, value in
            newProgresses[inIndex] += newSpeeds[inIndex]
        }
        print(newProgresses)
        let tempProgress = newProgresses
        if let value = tempProgress.first {
            var removeIndexArray = [Int]()
            for (index, value) in tempProgress.enumerated() {
                if value >= 100 {
                    removeIndexArray.append(index)
                } else {
                    break
                }
            }
            if !removeIndexArray.isEmpty {
                removeCountArray.append(removeIndexArray.count)
                
                removeIndexArray.reversed().forEach { index in
                    newProgresses.remove(at: index)
                }
                removeIndexArray.reversed().forEach { index in
                    newSpeeds.remove(at: index)
                }
            }
        } else {
            break
        }
    }
    print(removeCountArray)
    return removeCountArray
}

solution([95, 95, 95, 95], [4, 3, 2, 1])
