/**
 (类的)Deinitialization 析构过程
 */

// 1 析构过程原理
// 每个类最多只能有一个析构器，而且析构器不带任何参数
// 析构器是在实例释放发生前被自动调用。不能主动调用析构器。
// 子类继承了父类的析构器，并且在子类析构器实现的最后，父类的析构器会被自动调用。

// 2 析构器实践
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(numberOfCoinsRequested: coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(numberOfCoinsRequested: coins)
    }
    deinit {
        Bank.receiveCoins(coins: coinsInPurse)
    }
}
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne!.winCoins(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")
