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
    private let tokenAPI = ""
    private let URL = ""
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
        items.addChild(name: item_name, value: item_value)
    }
    return data.xmlString
}
