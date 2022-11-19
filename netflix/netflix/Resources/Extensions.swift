//
//  Extensions.swift
//  netflix
//
//  Created by Safar Safarov on 19/11/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }   
}
