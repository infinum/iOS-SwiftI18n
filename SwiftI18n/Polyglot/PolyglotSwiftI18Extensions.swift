//
//  PolyglotSwiftI18Extensions.swift
//  RBANative
//
//  Created by Vlaho Poluta on 06/05/2018.
//  Copyright © 2018 RBANative. All rights reserved.
//

import UIKit
import SwiftI18n

extension String {
    
    public var localized: String {
        return localised
    }
    
    public func localizedFormat(with args: CVarArg...) -> String {
        return String(format: self.localised, arguments: args)
    }
}

extension Language: Equatable {
    
    static func == (lhs: Language, rhs: Language) -> Bool {
        return lhs.languageCode == rhs.languageCode
    }
    
}

struct Localizable<Base: LocKeyAcceptable> {
    var base: Base
}

protocol LocKeyAcceptable {
    var locTitleKey: String? { get set }
}

extension LocKeyAcceptable {
    var loc: Localizable<Self> {
        return Localizable(base: self)
    }
}

extension Localizable {
    
    var titleKey: Strings? {
        get { return base.locTitleKey.flatMap { Strings(rawValue: $0) } }
        set { base.locTitleKey = newValue?.rawValue }
    }
    
}

extension UIBarButtonItem: LocKeyAcceptable {}
extension UILabel: LocKeyAcceptable {}
extension UINavigationItem: LocKeyAcceptable {}
extension UITabBarItem: LocKeyAcceptable {}
extension UITextView: LocKeyAcceptable {}
extension UIButton: LocKeyAcceptable {}
extension UITextField: LocKeyAcceptable {}
extension UIViewController: LocKeyAcceptable {}

extension Localizable where Base: UIButton {
    
    func titleKey(for state: UIControlState) -> Strings? {
        return base.locTitleKey(for: state).flatMap { Strings(rawValue: $0) }
    }
    
    func setTitleKey(_ key: Strings, for state: UIControlState) {
        return base.setLocTitleKey(key.rawValue, for: state)
    }
}

extension Localizable where Base: UITextField {
    
    var placeholderKey: Strings? {
        get { return base.locPlaceholderKey.flatMap { Strings(rawValue: $0) } }
        set { base.locPlaceholderKey = newValue?.rawValue }
    }
}