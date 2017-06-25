/**
 Type Casting 类型转换
 `is`  `as`
 */

// 1 定义一个类层次作为例子
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// 数组 library 的类型被推断为 [MediaItem]
for v in library {          // v 在此处是 MediaItem 类型
    print(v.name)
}

// 2 检查类型(Checking Type)  `is`
var movieCount = 0
var songCount = 0
for item in library {
    if (item is Movie) {
        movieCount += 1
    } else if (item is Song) {
        songCount += 1
    }
}

// 3 向下转型(Downcasting)    `as?`   `as!`
// 条件形式(conditional form) as? 返回一个你试图向下转成的类型的可选值(optional value)
// 强制形式 as! 把试图向下转型和强制解包(force-unwraps)转换结果结合为一个操作。
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}

// 4 Any和AnyObject的类型转换
// AnyObject可以表示任何类类型的实例
// Any可以表示任何类型，包括函数类型
