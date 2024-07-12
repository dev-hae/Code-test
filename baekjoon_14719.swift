/// https://www.acmicpc.net/problem/14719
/// 백준 빗물 문제

let arraySize = readLine()!.split(separator: " ").map { Int($0)! }

let rain = readLine()!.split(separator: " ").map { Int($0)! }

var tempArrayLeft = Array(repeating: 0, count: rain.count )
var tempArrayRight = Array(repeating: 0, count: rain.count )

var nowInt = 0
var tempArray = Array(repeating: 0, count: rain.count )
for i in 0 ..< rain.count {
    if nowInt <= rain[i] {
        nowInt = rain[i]
        tempArrayLeft = tempArray
    }
    else {
        tempArray[i] = nowInt - rain[i]
    }
}

nowInt = 0
tempArray = Array(repeating: 0, count: rain.count )
for i in (0 ..< rain.count).reversed() {
    if nowInt <= rain[i] {
        nowInt = rain[i]
        tempArrayRight = tempArray
    }
    else {
        tempArray[i] = nowInt - rain[i]
    }
}

var result = 0
for i in 0 ..< rain.count {
    if tempArrayRight[i] > tempArrayLeft[i] {
        result += tempArrayRight[i]
    }
    else {
        result += tempArrayLeft[i]
    }
}

print(result)
