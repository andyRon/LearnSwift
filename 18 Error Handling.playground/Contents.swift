/**
 Error Handling
 */
// 表示并抛出错误
// `Error`空协议表明该类型可以用于错误处理
enum VendingMachineError: Error {
    case InvalidSelection //选择无效 
    case InsufficientFunds(coinsNeeded: Int) //金额不足
    case OutOfStock //缺货
}
throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

// 处理错误
// ??