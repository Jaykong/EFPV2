//: Playground - noun: a place where people can play
import RxSwift
import SwiftyJSON
Observable.of(1, 3, 3, 4).subscribe(onNext: {

    print($0)
})

let str = "{\"paName\":\"paJoe\",\"parentGroupName\":\"parentGroupName\",\"paGroupName\":\"paGroupName\"}"

let json = JSON(rawValue: str)
let json2 = JSON(stringLiteral: str)
let json3 = try JSON(data: str.data(using: .utf8)!, options: .allowFragments)

let json4 = JSON(parseJSON: "{\"isPa\":1}")

print(json4)
json3["paName"]
json4["paName"]

print(json)
