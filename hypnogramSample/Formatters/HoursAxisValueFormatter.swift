//
//  HoursAxisValueFormatter.swift
//  hypnogramSample
//
//  Created by Adrien Catanas on 17/01/2019.
//  Copyright © 2019 Rythm. All rights reserved.
//

import Foundation
import Charts

public class HoursAxisValueFormatter: NSObject, IAxisValueFormatter {
    private let dateFormatter = DateFormatter()
    private let dateTime: Date!

    init(startHour: String) {
        dateFormatter.dateFormat = "HH:mm"
        dateTime = dateFormatter.date(from: startHour)
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if value == 0.0 {
            return ""
        }
        return dateFormatter.string(from: dateTime.addingTimeInterval(value * 60.0))
    }
}
