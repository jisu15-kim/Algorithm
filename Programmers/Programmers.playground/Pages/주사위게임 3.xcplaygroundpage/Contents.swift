//: [Previous](@previous)

import Foundation

/*
 1부터 6까지 숫자가 적힌 주사위가 네 개 있습니다. 네 주사위를 굴렸을 때 나온 숫자에 따라 다음과 같은 점수를 얻습니다.

1.  네 주사위에서 나온 숫자가 모두 p로 같다면 1111 × p점을 얻습니다.
2. 세 주사위에서 나온 숫자가 p로 같고 나머지 다른 주사위에서 나온 숫자가 q(p ≠ q)라면 (10 × p + q)2 점을 얻습니다.
 주사위가 두 개씩 같은 값이 나오고, 나온 숫자를 각각 p, q(p ≠ q)라고 한다면 (p + q) × |p - q|점을 얻습니다.
 
3. 어느 두 주사위에서 나온 숫자가 p로 같고 나머지 두 주사위에서 나온 숫자가 각각 p와 다른 q, r이라면 q × r점을 얻습니다.
4. 네 주사위에 적힌 숫자가 모두 다르다면 나온 숫자 중 가장 작은 숫자 만큼의 점수를 얻습니다.
5. 네 주사위를 굴렸을 때 나온 숫자가 정수 매개변수 a, b, c, d로 주어질 때, 얻는 점수를 return 하는 solution 함수를 작성해 주세요.
 */

func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    
    var score = 0
    let input = [a, b, c, d]
    let inputSet = NSCountedSet(array: input)
    let inputSetToInt = inputSet.allObjects.map { $0 as! Int }
    
    if inputSet.count == 1 {
        score = 1111 * inputSetToInt[0]
    } else if inputSet.count == 2 {
        if inputSet.count(for: inputSetToInt[0]) == 2 {
            let first = inputSetToInt[0] + inputSetToInt[1]
            let second = (inputSetToInt[0] - inputSetToInt[1]).magnitude
            let result = first * Int(second)
            score = result
        } else if inputSet.count(for: inputSetToInt[0]) == 3 {
            let result = pow(Float((10 * inputSetToInt[0]) + inputSetToInt[1]), 2)
            score = Int(result)
        } else if inputSet.count(for: inputSetToInt[0]) == 1 {
            let result = pow(Float((10 * inputSetToInt[1]) + inputSetToInt[0]), 2)
            score = Int(result)
        }
        
    } else if inputSet.count == 3 {
        if inputSet.count(for: inputSetToInt[0]) == 2 {
            score = inputSetToInt[1] * inputSetToInt[2]
        } else if inputSet.count(for: inputSetToInt[1]) == 2 {
            score = inputSetToInt[0] * inputSetToInt[2]
        } else if inputSet.count(for: inputSetToInt[2]) == 2 {
            score = inputSetToInt[0] * inputSetToInt[1]
        }
    } else if inputSet.count == 4 {
        let sortedInput = inputSetToInt.sorted { $0 < $1 }
        score += sortedInput[0]
    }
    return score
}

solution(2, 2, 2, 2)
solution(4, 1, 4, 4)
solution(6, 3, 3, 6)
solution(2, 5, 2, 6)
solution(6, 4, 2, 5)
