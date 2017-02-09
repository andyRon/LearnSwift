/**
 Nested Types 嵌套类型
 */

struct BlackjackCard {  // 二十一点
    
    // nested Suit enumeration
    enum Suit: Character {  // 描述扑克牌的四种花色
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {  // 用来反映Ace的两个数值()
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                    return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")

// 引用嵌套类型
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
                