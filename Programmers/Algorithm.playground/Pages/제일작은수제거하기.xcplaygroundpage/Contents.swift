import UIKit

func solution(_ arr:[Int]) -> [Int] {
    var result = arr
    
    var leastElement = arr.sorted { $0 < $1 }[0]
    result.remove(at: arr.lastIndex(of: leastElement)!)
    
    if result.count == 0 {
        result.append(-1)
    }
    
    return result
}
