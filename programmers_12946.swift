///하노이의 탑
///문제의 본질, 규칙성을 잘 알아두기!
///https://school.programmers.co.kr/learn/courses/30/lessons/12946
import Foundation

var result = [[Int]]()
func solution(_ n:Int) -> [[Int]] {
    hanoi(n:n, start: 1, end: 3, other: 2)
    return result
}
func hanoi(n: Int, start: Int, end: Int, other: Int){
    if n == 1 {
        result.append([start, end])
        return
    }
   
    hanoi(n: n-1, start: start, end: other, other: end)
    result.append([start, end])
    hanoi(n: n-1, start: other, end: end, other: start)
}
