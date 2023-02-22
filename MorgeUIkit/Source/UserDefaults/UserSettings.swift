//
//  UserSettings.swift
//  MorgeUIkit
//
//  Created by MAC on 20.02.2023.
//

import Foundation

final class UserSettings {

    private enum SettingsKey: String {
        case userModel
    }

    static var userModel: UserModel? {

        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKey.userModel.rawValue) as? Data,
                  let decodedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else { return nil }
            return decodedData
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.userModel.rawValue

            if let userModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: key)
                }
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
