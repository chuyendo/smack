//
//  Channel.swift
//  Smack
//
//  Created by mac on 1/26/18.
//  Copyright © 2018 Jonny B. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
