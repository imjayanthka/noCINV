//
//  XMLCreation.swift
//  HealthApp
//
//  Created by Jayanth Kanugo on 6/21/16.
//  Copyright © 2016 Jayanth Kanugo. All rights reserved.
//

import Foundation
import SwiftHTTP

class HttpPost {
    private let tokenAPI = "B2ACF660FF6976BF379BF902C5A6234D"
    private let URL = "https://redcap-dev.umh.edu/api/"
    private let content = "record"
    private let format = "xml"
    private let type = "flat"
    private let returnContent = "count"
    private let overwriteBehavior = "normal"
    
    
    func postFunc(data: String) -> Bool {
        var returnVal = true
        let params = ["token": self.tokenAPI, "content": self.content, "format": self.format, "type": self.type, "overwriteBehavior": self.overwriteBehavior, "data": data, "returnContent": self.returnContent]
        do {
            let opt = try HTTP.POST(self.URL, parameters: params)
            opt.start { response in
                //do things...
                if response.statusCode != 200 {
                    returnVal = false
                }
            }
        } catch let error {
            returnVal = false
            print("got an error creating the request: \(error)")
            
        }
        return returnVal
    }
}

func createXmlString(dataCollection: [String: String]) -> String {
    let data = AEXMLDocument()
    let records = data.addChild(name: "records")
    let items = records.addChild(name: "item")
    print("Count: \(dataCollection.count)")
    for (item_name, item_value) in dataCollection {
        switch item_name {
        case "dehydration", "anxiety", "current_smoker":
            if item_value == "0"{
               items.addChild(name: item_name, value: "1")
            } else {
                items.addChild(name: item_name, value: "0")
            }
        case "race":
            switch item_value {
            case "0":
                items.addChild(name: item_name, value: "A")
            case "1":
                items.addChild(name: item_name, value: "H")
            case "2":
                items.addChild(name: item_name, value: "W")
            default:
                items.addChild(name: item_name, value: "B")
            }
        case "sex":
            if item_value == "0" {
                items.addChild(name: item_name, value: "M")
            } else {
               items.addChild(name: item_name, value: "F")
            }
        default:
            items.addChild(name: item_name, value: item_value)
        }
      
    }
    return data.xmlString
}