//: [Previous](@previous)

import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    // 최대공약수
    func gcd(_ a: Int, _ b: Int) -> Int {
        let r = a % b
        
        if r != 0 { return gcd(b, r) }
        else { return b }
    }
    
    // 최대공배수
    func lcm(_ a: Int, _ b: Int) -> Int {
      return a * b / gcd(a, b)
    }
    
    var result = [Int]()
    
    // 공배수 분모 만들기
    let denomLcm = lcm(denom1, denom2)
    let newNumer = (numer1 * denomLcm / denom1) + (numer2 * denomLcm / denom2)
    
    // 기약분수
    let resultGcd = gcd(denomLcm, newNumer)
    
    // 배열추가
    result.append(newNumer / resultGcd)
    result.append(denomLcm / resultGcd)

    return result
}

solution(1, 2, 3, 4)
solution(9, 2, 1, 3)
solution(1, 3, 1, 3)
