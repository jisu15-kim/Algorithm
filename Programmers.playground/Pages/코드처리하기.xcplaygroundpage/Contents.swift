import UIKit


/*
 문자열 code가 주어집니다.
 code를 앞에서부터 읽으면서 만약 문자가 "1"이면 mode를 바꿉니다. mode에 따라 code를 읽어가면서 문자열 ret을 만들어냅니다.

 mode는 0과 1이 있으며, idx를 0 부터 code의 길이 - 1 까지 1씩 키워나가면서 code[idx]의 값에 따라 다음과 같이 행동합니다.

 mode가 0일 때
 code[idx]가 "1"이 아니면 idx가 짝수일 때만 ret의 code[idx]를 추가합니다.
 code[idx]가 "1"이면 mode를 0에서 1로 바꿉니다.
 mode가 1일 때
 code[idx]가 "1"이 아니면 idx가 홀수일 때만 ret의 맨 뒤에 code[idx]를 추가합니다.
 code[idx]가 "1"이면 mode를 1에서 0으로 바꿉니다.
 문자열 code를 통해 만들어진 문자열 ret를 return 하는 solution 함수를 완성해 주세요.

 단, 시작할 때 mode는 0이며, return 하려는 ret가 만약 빈 문자열이라면 대신 "EMPTY"를 return 합니다.
 */

func solution(_ code:String) -> String {
    
    var result = "EMPTY"
    var currentMode = 0
    var solution: [String] = []
    
    var myCode = code.map { String($0) }
    
    myCode.enumerated().forEach {
        if let mode = Int($1) {
            if currentMode == 1 && mode == 1 {
                currentMode = 0
            } else {
                currentMode = mode
            }
        } else {
            if currentMode == 0 {
                if $0 % 2 == 0 {
                    solution.append($1)
                }
            } else {
                if $0 % 2 == 1 {
                    solution.append($1)
                }
            }
        }
    }
    if !solution.isEmpty {
        result = solution.joined()
    }
    return result
}

solution("abc1abc1abc")
