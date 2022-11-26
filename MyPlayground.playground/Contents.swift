import UIKit
import XCTest
//
var line = "31:00"
//let first = Array(line)[0]
//let second = Array(line)[1]
//
//let three = Array(line)[3]
//let foor = Array(line)[4]
//
//let hourstr = String(first) + String(second)
//let minutestr = String(three) + String(foor)
//
//var out1 = false
//var out2 = false
//var outputfirst = "NO"
//
//print(hourstr)
//switch Int(hourstr)! {
//case 0...23:
//        out1 = true
//    default:
//    out1 = false
//}
//
//switch Int(minutestr)! {
//    case 0...59:
//        out2 = true
//    default:
//    out2 = false
//}
//
//if out1 && out2 {
//    outputfirst = "YES"
//} else {
//    outputfirst = "NO"
//
//}
//print(outputfirst)
//
//
//
//line = "11 22 111"
//
//
//let linessplit = line.split(separator: " ")
//print(linessplit)
//
//var lineoccur = [Int]()
//
//
//for item in linessplit {
//    let test = Int(item)
//    lineoccur.append(test!)
//}
//
//print(lineoccur)
//var output = ""
////var tabBefortOutput = [String]
//lineoccur.forEach { number in
//    switch number {
//    case 1:
//        output.append("a")
//    case 11:
//        output.append("b")
//    case 111:
//        output.append("c")
//    case 2:
//        output.append("d")
//    case 22:
//        output.append("e")
//    case 222:
//        output.append("f")
//    case 3:
//        output.append("g")
//    case 33:
//        output.append("h")
//    case 333:
//        output.append("i")
//    case 4:
//        output.append("j")
//    case 44:
//        output.append("k")
//    case 444:
//        output.append("l")
//    case 5:
//        output.append("m")
//    case 55:
//        output.append("n")
//    case 555:
//        output.append("o")
//
//    case 6:
//        output.append("p")
//    case 66:
//        output.append("q")
//    case 666:
//        output.append("r")
//    case 7:
//        output.append("s")
//    case 77:
//        output.append("t")
//    case 777:
//        output.append("u")
//    case 7777:
//        output.append("v")
//    case 8:
//        output.append("w")
//    case 88:
//        output.append("x")
//    case 888:
//        output.append("y")
//    case 9:
//        output.append("z")
//    default:
//        output.append(" ")
//    }
//}
//
//print(String(output))
//
//
//
//
//// MARK: - essaie
//
//
//var arrayLine = line.split(separator: "\n")
//
//print(arrayLine)
//let numberOfTraget = arrayLine.removeFirst()
//
//print(numberOfTraget)
//
//let name = "Marie Curie"
//let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
//let firstName = name[..<firstSpace]
//
//"Coucou".lexicographicallyPrecedes("zzzzz")
//
//"first String".enumerated()
//"second String".hasSuffix("i")
//
//let lowercase = "a"..."z"
//print(lowercase.contains("B"))
//








// MARK: - exo 3



    func load(file named: String) -> String? {
        guard let fileUrl = Bundle.main.url(forResource: named, withExtension: "txt") else {
            return nil
        }

        guard let content = try? String(contentsOf: fileUrl, encoding: .utf8) else {
            return nil
        }

        return content
    }



let nbrExo = 3


line = load(file: "input\(nbrExo)")!

struct Voyage {
    let HoursDepart: String
    let CityDepart: String
    let empreinte: String
}

var dateFormater = DateFormatter()
dateFormater.dateFormat = "HH:mm:ss"

var sLine = line
let nbrTotalVoyage = sLine.split(separator: "\n").first
sLine.removeFirst(nbrTotalVoyage!.count + 2)

let horaireDuJour = sLine.split(separator: "\n")
var voyages = sortedHoraireDuJour()

func sortedHoraireDuJour() -> [Voyage] {
    var output = [Voyage]()
    horaireDuJour.forEach { item in
        let voyageArray = item.split(separator: " ")
        let voyage = Voyage(HoursDepart: String(voyageArray.first!),
                            CityDepart: String(voyageArray[1]),
                            empreinte: String(voyageArray.last!))
        output.append(voyage)
    }
    return output
}


var voyageAller: [Voyage] {
    var filter = voyages.filter { $0.CityDepart == "Paris-Lyon"}
    return filter.sorted(by: { dateFormater.date(from: $0.HoursDepart)!  < dateFormater.date(from: $1.HoursDepart)! })
}
print("voyageAller.count 1 : \(voyageAller.count)")

var voyageRetour: [Voyage] {
    var filter = voyages.filter { $0.CityDepart == "Lyon-Paris"}
    return filter.sorted(by: { dateFormater.date(from: $0.HoursDepart)!  < dateFormater.date(from: $1.HoursDepart)! })
}
print("voyageRetour.count 1 : \(voyageRetour.count)")


var probable = Int.max
voyageAller.forEach { aller in
    let filterRetourByTime = voyageRetour.filter {
        guard let hoursDepart = dateFormater.date(from: $0.HoursDepart) else { return false }
        guard let hoursRetour = dateFormater.date(from: aller.HoursDepart) else { return false }
        return hoursDepart > hoursRetour
    }
    
    let sortedRetourByEmpreinte = filterRetourByTime.sorted(by: { $0.empreinte < $1.empreinte })
    
    for retour in sortedRetourByEmpreinte {
        let aller = Int(aller.empreinte)!
        let retour = Int(retour.empreinte)!
        let total = aller + retour
        guard total < probable else { return }
            probable = total
    }

}
print(probable)
print("corigé: \(load(file: "output\(nbrExo)")!)")




// FONCTIONNE  8888!!!!!!!

