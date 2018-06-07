// Returns the index of the first occurrence of needle in haystack,
// or -1 if needle is not part of haystack
func strStr(haystack: String, _ needle: String) -> Int {
    let hCount = haystack.count, nCount = needle.count
    if hCount == 0 || hCount < nCount {
        return -1
    }
    
    for i in 0...nCount - nCount {
        if haystack[i] == needle[0] {
            for j in 0..<needle.count {
                if haystack[i + j] != needle[j] {
                    break
                } else {
                    if j == needle.count - 1 {
                        return i
                    }
                }
            }
        }
    }
    return -1
}

extension String {
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}


func strStr2(haystack: String, _ needle: String) -> Int {
    guard haystack.count != 0 && haystack.count >= needle.count else {
        return -1
    }
    
    for i in 0...haystack.count - needle.count {
        guard haystack[i] == needle[0] else {
            continue
        }
        
        for j in 0 ..< needle.count {
            guard haystack[i + j] == needle[j] else {
                break
            }
            if j == needle.count - 1 {
                return i
            }
        }
    }
    
    return -1
}

// Guard语句的好处是判断条件永远是我们希望的条件而不是特殊情况，且成功避免了大量的if嵌套。



