//: [Previous](@previous)

import Foundation

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    
    let resultArr = numlist.sorted { first, second -> Bool in
        
        let offsetFirst = abs(first - n)
        let offsetSecond = abs(second - n)
        
        if offsetFirst == offsetSecond {
            return first > second
        } else {
            return offsetFirst < offsetSecond
        }
    }
    return resultArr
}

solution([1, 2, 3, 4, 5, 6], 4)
