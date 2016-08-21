//
//  UITextField+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UITextField: I18n {
    
    private static let loc_titleKey = "KEY"
    private static let loc_placeholderKey = "PKEY"
    
    @IBInspectable public var locTitleKey: String? {
        
        get {
            return loc_keysDictionary[UITextField.loc_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UITextField.loc_titleKey] = newValue
            loc_localeDidChanged()
        }
        
    }
    
    @IBInspectable public var locPlaceholderKey: String? {
        
        get {
            return loc_keysDictionary[UITextField.loc_placeholderKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UITextField.loc_placeholderKey] = newValue
            loc_localeDidChanged()
        }
        
    }
    
    #if CASE
    
    private static let case_titleKey = "CKEY"
    private static let case_placeholderKey = "CPKEY"
    
    @IBInspectable public var caseTransform: String? {
    
        get {
            return loc_keysDictionary[UITextField.case_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UITextField.case_titleKey] = newValue
            loc_localeDidChanged()
        }
    }
    
    @IBInspectable public var casePlaceholderTransform: String? {
    
        get {
            return loc_keysDictionary[UITextField.case_placeholderKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UITextField.case_placeholderKey] = newValue
            loc_localeDidChanged()
        }
    }
    
    #endif
    
    func loc_localeDidChanged() {
        let text = loc_keysDictionary[UITextField.loc_placeholderKey]?.localised
        let placeholder = loc_keysDictionary[UITextField.loc_titleKey]?.localised
        
        if let text = text {
            #if CASE
                let caseTransform = loc_keysDictionary[UITextField.case_titleKey]
                self.text = text?.transform(with: I18nCaseTransform(rawValue: caseTransform ?? ""))
            #else
                self.text = text
            #endif
        }
        
        if let placeholder = placeholder {
            #if CASE
                let casePlaceholderTransform = loc_keysDictionary[UITextField.case_placeholderKey]
                self.placeholder = placeholder?.transform(with: I18nCaseTransform(rawValue: caseTransform ?? ""))
            #else
                self.text = text
            #endif
        }
        
    }
    
}
