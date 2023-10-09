//
//  Extensions.swift
//  StockTrackerApp
//
//  Created by admin on 09/28/23.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    public static var royalBlue: Color {
        return Color(UIColor(red: 3/255, green: 37/255, blue: 108/255, alpha: 1.0))
    }
}
extension Color {
    public static var aero: Color {
        return Color(UIColor(red: 6/255, green: 190/255, blue: 255/255, alpha: 1.0))
    }
}
extension Color {
    public static var carrotOrange: Color {
        return Color(UIColor(red: 244/255, green: 157/255, blue: 55/255, alpha: 1.0))
    }
}
extension Color {
    public static var columbiaBlue: Color {
        return Color(UIColor(red: 187/255, green: 222/255, blue: 240/255, alpha: 1.0))
    }
}


//Normalization

extension Array where Element == CGFloat {
    
    
    var normalizedValues: [CGFloat] {
        if let min = self.min(), let max = self.max(){
            return self.map({($0 - min) / (max - min)})
        }
        // In the case we just have an array with no min or max we return empty array
        return []
    }
}
