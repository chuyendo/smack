//
//  Channel.swift
//  Smack
//
//  Created by mac on 1/26/18.
//  Copyright © 2018 Jonny B. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
