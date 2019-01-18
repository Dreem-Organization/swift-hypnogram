//
//  StagesAxisValueFormatter.swift
//  hypnogramSample
//
//  Created by Adrien Catanas on 17/01/2019.
//  Copyright © 2019 Rythm. All rights reserved.
//

import Foundation
import Charts

public class StagesAxisValueFormatter: NSObject, IAxisValueFormatter {
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        switch value {
        case 0.0:
            return "WAKE"
        case 1.0:
            return "LIGHT"
        case 2.0:
            return "DEEP";
        case 3.0:
            return "REM";
        default:
            return ""
        }
    }
}
