// https://school.programmers.co.kr/learn/courses/30/lessons/86971
// 프로그래머스 - 전력망을 둘로 나누기
// 초기화 방법 좀 공부하기. Map. Dic.. 이런거..

import Foundation

struct Tree {
    var list = [Int]()
}

var Alist =  [Tree]()
func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var ans = 10000000
    
    for i in 0...n {
        var tree = Tree()
        Alist.append(tree)
    }
    
    for wire in wires {
        Alist[wire[0]].list.append(wire[1])
        Alist[wire[1]].list.append(wire[0])
    }
   
    for wire in wires {
        var isVisited : [Bool] = Array(repeating: false, count: n+1)
        var lef = wire[0]
        var rig = wire[1]
        isVisited[lef] = true
        isVisited[rig] = true
        let ll = explore(lef, isVisited)
        let rr = explore(rig, isVisited)
        var temp = abs(ll - rr)
       if ans > temp {
           ans = temp
       }
        
    }
    return ans
}

func explore(_ idx: Int, _ isVisited: [Bool]) -> Int {
    var isVisited = isVisited
    var ans = 1
    for item in Alist[idx].list {
        if isVisited[item] == false {
            isVisited[item] = true
            ans += explore(item, isVisited)
        }
    }
    return ans
}
