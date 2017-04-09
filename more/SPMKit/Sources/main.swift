import RandomKit



func randomKit() {
    
    let r1 = Int.random(within: -100 ... 100, using: &ARC4Random.default)
    let r2 = Int.random(using: &Xoroshiro.default)

    let r3 = Int.random(to:  2, using: &Xoroshiro.default)  // Either 0 or 1
    let r4 = Int.random(to:  0, using: &Xoroshiro.default)  // Always 0
    let r5 = Int.random(to: 32, using: &Xoroshiro.default)  // 15
    let r6 = Int.random(to: -5, using: &Xoroshiro.default)  // -3
    // ...
    print(r5, r6)
}


//randomKit()
