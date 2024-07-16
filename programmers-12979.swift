// https://school.programmers.co.kr/learn/courses/30/lessons/12979#
// 알고리즘 문제~
// 프로그래머스 - 기지국 설치

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0

    var pos = 1
    var area = 2 * w + 1
    for station in stations {
        var apartSize = station - w - pos
        if apartSize > 0 {
            answer += apartSize/area
            if (apartSize % area) > 0 {
                answer += 1
            }
        }
        pos = station + w + 1
        if pos > n {
            break
        }
    }
    if pos < n + 1 {
        var apartSize = n + 1 - pos
        answer += apartSize/area
        if apartSize % area != 0 {
            answer += 1
        }
    }
    return answer
}
