//https://school.programmers.co.kr/learn/courses/30/lessons/43162
//DFS로 풀었음. BFS도 다시공부!

import Foundation

var isVisted: [Bool] = Array(repeating: false, count: 200)
func solution(_ n:Int, _ computers:[[Int]]) -> Int {

    var num = 0
    for i in 0..<n {
        if isVisted[i] == false {
            num += 1
            isVisted[i] = true
            visiting(i, computers: computers, n: n)
        }
    }


    return num
}

func visiting(_ i: Int, computers: [[Int]], n:Int) {

    for j in 0..<n {
        if isVisted[j] == false && computers[i][j] == 1 {
            isVisted[j] = true
            visiting(j, computers: computers, n: n)
        }
    }

}
