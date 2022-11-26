import UIKit

func load(file named: String) -> String? {
    guard let fileUrl = Bundle.main.url(forResource: named, withExtension: "txt") else {
        return nil
    }

    guard let content = try? String(contentsOf: fileUrl, encoding: .utf8) else {
        return nil
    }

    return content
}
for i in 1...7 {
    var numExo = i

    var greeting = "Hello, playground"
    //
    var line = load(file: "input\(numExo)")!
    
    let first = Array(line)[0]
    let second = Array(line)[1]
    
    let three = Array(line)[3]
    let foor = Array(line)[4]
    
    let hourstr = String(first) + String(second)
    let minutestr = String(three) + String(foor)
    
    var out1 = false
    var out2 = false
    var outputfirst = "NO"
    
    print(hourstr)
    switch Int(hourstr)! {
    case 0...23:
        out1 = true
    default:
        out1 = false
    }
    
    switch Int(minutestr)! {
    case 0...59:
        out2 = true
    default:
        out2 = false
    }
    
    if out1 && out2 {
        outputfirst = "YES"
    } else {
        outputfirst = "NO"
        
    }
    print(outputfirst)
    
    var resultat: Bool {
        outputfirst == load(file: "output\(numExo)")
    }
    print("correction: \(resultat)")
}
