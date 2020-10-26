//
//  ServiceManager.swift
//  IbottaDevTest
//
//  Created by Muhammad Luqman on 10/25/20.
//

import Foundation

class ServiceManager {
    
    /// Read data for json file
    func readLocalFile(forName name: String) -> Data? {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    /// Parse data to model
    func parse(jsonData: Data) ->[Offer]? {
        
        do {
            let decodedData = try JSONDecoder().decode([Offer].self, from: jsonData)
            return decodedData
        } catch {
            print("error:\(error)")
            return nil
        }
    }
}
