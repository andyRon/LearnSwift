
/*:
 使用 Optional Chaining 所得到的东西其实都是 Optional 的，因为 Optional Chaining 是随时都可能提前返回 nil。
 
 */

class Country {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Province {
    var country: Country?
}

class City {
    var province: Province?
    var counry: Country?
}

class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}

extension Toy {
    func play() {
        print("玩玩具")
    }
}

let 👶 = Child()
let pet = Pet()
let toy = Toy(name: "凹凸曼")
pet.toy = toy
👶.pet = pet 

let toyName = 👶.pet?.toy?.name


let playClosure = { (child: Child) -> () in
    child.pet?.toy?.play()
}

/*:
 新版本优化了？
 ```swift
 let playClosure = { (child: Child) -> ()? in
 child.pet?.toy?.play()
 }
 ```
 
 */
 
 



if let result: () = playClosure(👶) {
    print("测试")
} else {
    print("测试2")
}

