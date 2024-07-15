// https://level.goorm.io/exam/167345/%EB%8B%A8%ED%92%8D%EB%82%98%EB%AC%B4/quiz/1
// readLine에 대해서 배웠다!
// 좀 더 깔끔하게 푸는 방법 배워보기!

let n = Int(readLine()!)!
var arr: [[Int]] = Array(repeating: [], count: n)
var day = 0

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i].append(contentsOf: input)
}
var count = 0

for x in 0..<n {
        for y in 0..<n {
            if arr[x][y] == 0 {
                count += 1
            }
        }
}
                                        
var temp = arr
while(count < (n*n)) {
    arr = temp
    count = 0
    day += 1
    for x in 0..<n {
        for y in 0..<n {
            if arr[x][y] > 0 {
                let ans = arr[x][y] - check(x:x, y:y)
                if ans < 1 {
                    temp[x][y] = 0
                    count += 1
                }
                else {
                    temp[x][y] = ans
                }
            }
            else {
                count += 1
            }
        }
    }
}
    
print(day)
    
func check(x: Int, y: Int) -> Int {
    var count = 0
    if x > 0, arr[x-1][y] == 0  {
        count += 1
    }
    if y > 0, arr[x][y-1] == 0 {
        count += 1
    }
    if (y + 1) < n, arr[x][y+1] == 0 {
        count += 1
    }
    if ( x + 1) < n, arr[x+1][y] == 0 {
        count += 1
    }
    return count
}
