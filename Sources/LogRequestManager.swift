//
//  LogRequestManager.swift
//  Starscream
//
//  Created by Mounika Gouni on 5/19/19.
//  Copyright © 2019 Vluxe. All rights reserved.
//

import Foundation
import UIKit

class LogRequestManager {
    static let shared = LogRequestManager()
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    }
    
    func string(from date : Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    func sendlogRequest(log: [Log], with token: String?) {
        var request = URLRequest(url: URL(string: "http://127.0.0.1:8090/logs")!)
        request.httpMethod = "POST"
        let jsonEncoder = JSONEncoder()
        request.httpBody = try? jsonEncoder.encode(log)
            //try? JSONSerialization.data(withJSONObject: log, options: [])
        request.addValue(UIDevice.current.identifierForVendor?.uuidString ?? "", forHTTPHeaderField: "Talk-Device-Identifier")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        print("Starscream Log request: \(log) token: \(String(describing: token)) httpBody: \(String(describing: request.httpBody))")

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                 print("DataTask error: " + error.localizedDescription + "\n")
            } else if let _ = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                print(response)
            }
        }
        
        task.resume()
    }
}
