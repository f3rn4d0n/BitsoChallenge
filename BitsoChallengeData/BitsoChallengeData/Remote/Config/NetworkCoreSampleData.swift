//
//  NetworkCoreSampleData.swift
//  BitsoChallengeData
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import Foundation

public struct NetworkCoreSampleData {
    
    private let bundle: Bundle?
    
    public init(bundle: Bundle?) {
        self.bundle = bundle
    }
    
    public func getData(for fileName: String) -> Data? {
     
        guard let url = bundle?.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return data
    }
}
