import Foundation

let fileString = CommandLine.arguments[1]
var fileExists = FileManager.default.fileExists(atPath: fileString)

var priceinCart = 0
var numOfNormalPriceProducts = 0
var numOfClearancePriceProducts = 0
var normalPriceValues  = [String]()
var clearancePriceValues = [String]()


if (fileExists){
    let data = try String(contentsOfFile: fileString, encoding: .utf8)
    let dataStrings = data.components(separatedBy: .newlines)
    

    for rowsData in dataStrings{

        let rowsArray = rowsData.components(separatedBy: ",")
        
        if rowsArray.count > 3 {
            
            if (Int(rowsArray[3])! > 3){
                if rowsArray[4] != "false"{
                    priceinCart += 1
                }
                if rowsArray[1] == rowsArray[2]{
                    numOfNormalPriceProducts += 1
                    normalPriceValues.append("$\(rowsArray[1])")
                }
                if Float(rowsArray[2])! < Float(rowsArray[1])!{
                    numOfClearancePriceProducts += 1
                    clearancePriceValues.append("$\(rowsArray[2])")
                }
            }
        }
    }
    print("Clearance Price: \(numOfClearancePriceProducts) products @ \(clearancePriceValues.joined(separator:"-"))")
    print("Normal Price: \(numOfNormalPriceProducts) product @ \(normalPriceValues.joined(separator: "-"))")
    print("Price In Cart: \(priceinCart) products")
}
else{
    print("Doesn't exist")
}


