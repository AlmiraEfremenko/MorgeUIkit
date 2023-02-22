//
//  UserModel.swift
//  MorgeUIkit
//
//  Created by MAC on 17.02.2023.
//

import Foundation

class UserModel: NSObject, NSCoding {

    let name: String

    init(name: String) {
        self.name = name
    }

    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
    }

    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
    }
}
