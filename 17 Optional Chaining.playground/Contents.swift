/**
 Optional Chaining  可选链式调用
 一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法
 */

// 使用可选链式调用代替强制展开
// 可选链式调用的返回结果与原本的返回结果具有相同的类型，但是被包装成了一个可选值。
class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// 为可选链式调用定义模型类
class Person2 {
    var residence: Residence2?
}
class Residence2 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) { self.name = name }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
func createAddress() -> Address {
    print("Function was called.")
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}
let andy = Person2()
andy.residence?.address = createAddress()       // 可选链式调用失败时，等号右侧的代码不会被执行。

// 通过可选链式调用调用方法
if let firstRoomName = andy.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
let andyHouse = Residence2()
andyHouse.rooms.append(Room(name: "Living Room"))
andyHouse.rooms.append(Room(name: "Kitchen"))
andy.residence = andyHouse
if let firstRoomName = andy.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// 访问可选类型的下标
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

// 连接多层可选链式调用
if let andyStreet = andy.residence?.address?.street {
    print("John's street name is \(andyStreet).")
} else {
    print("Unable to retrieve the address.")
}
let andyAddress = Address()
andyAddress.buildingName = "东方明珠"
andyAddress.street = "南京东路100号"
andy.residence?.address = andyAddress
if let andyStreet = andy.residence?.address?.street {
    print("John's street name is \(andyStreet).")
} else {
    print("Unable to retrieve the address.")
}

// 在方法的可选返回值上进行可选链式调用
if let buildingIdentifier = andy.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
if let beginsWithThe =
    andy.residence?.address?.buildingIdentifier()?.hasPrefix("东") {
    if beginsWithThe {
        print("John's building identifier begins with \"东\".")
    } else {
        print("John's building identifier does not begin with \"东\".")
    }
}
