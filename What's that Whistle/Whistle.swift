//
//  Whistle.swift
//  What's that Whistle
//
//  Created by Nick Sagan on 20.12.2021.
//

import CloudKit
import UIKit

class Whistle: NSObject {
    var recordID: CKRecord.ID!
    var genre: String!
    var comments: String!
    var audio: URL!
}
