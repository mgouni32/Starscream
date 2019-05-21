//
//  Log.swift
//  Starscream
//
//  Created by Mounika Gouni on 5/21/19.
//  Copyright © 2019 Vluxe. All rights reserved.
//

import Foundation
public struct Log: Codable {
    public let message: String
    public let timestamp: Date
    public let transactionID: UUID
    public let audioID: UUID?
    public let storeNumber: String?
    public let channelID: String?
    /// JSON Dictionary object to get more diagnostic info()
    public let diagnostics: [String: String]?
    
    public init (message: String, timestamp: Date, transactionID: UUID, audioID: UUID? = nil, storeNumber: String? = nil, channelID: String? = nil, diagnostics: [String: String]? = nil) {
        self.message = message
        self.timestamp = timestamp
        self.transactionID = transactionID
        self.audioID = audioID
        self.storeNumber = storeNumber
        self.channelID = channelID
        self.diagnostics = diagnostics
    }
}
