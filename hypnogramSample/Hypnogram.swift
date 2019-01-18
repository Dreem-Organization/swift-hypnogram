//
//  Hypnogram.swift
//  hypnogramSample
//
//  Created by Adrien Catanas on 04/07/2018.
//  Copyright © 2018 Rythm. All rights reserved.
//

import Foundation
import Charts

class Hypnogram: NSObject {
    var currentHypnoArray = [Int]()
    
    init(basicHypno: [Int]) {
        super.init()
        currentHypnoArray = basicHypno
    }
    
    func getHypnoWithPoints() -> [(Int, Int)] {
        var currentValue = currentHypnoArray.first
        var countValue = 0
        var customHypno = [(Int, Int)]()
        var hypnoWithPoints = [(Int, Int)]()
        
        // stages : count number of stages
        for (i, index) in currentHypnoArray.enumerated() {
            if index == currentValue {
                countValue = countValue + 1
            } else {
                customHypno.append((currentValue!, countValue))
                currentValue = index
                countValue = 1
            }
            if i == (currentHypnoArray.count - 1) {
                customHypno.append((currentValue!, countValue))
            }
        }
        
        // create array with points
        for (count, realIndex) in customHypno.enumerated() {
            if count == 0 {
                hypnoWithPoints.append((count, realIndex.0))
                hypnoWithPoints.append((realIndex.1, realIndex.0))
            } else {
                hypnoWithPoints.append(((hypnoWithPoints.last?.0)!, realIndex.0))
                hypnoWithPoints.append(((hypnoWithPoints.last?.0)! + realIndex.1, realIndex.0))
            }
        }

        return hypnoWithPoints
    }
    
    private func createDataSet(values: [ChartDataEntry]) -> LineChartDataSet {
        let dataSet = LineChartDataSet(values: values, label: "")
        dataSet.drawCirclesEnabled = false
        dataSet.drawCircleHoleEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.colors = [UIColor.orange] //[UIColor.blue]
        dataSet.lineWidth = 1.8
        return dataSet
    }
    
    func getDataSets(hypno: [(Int, Int)]) -> [LineChartDataSet] {
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        var stageValues = [ChartDataEntry]()
        for (index, _) in hypno.enumerated() {
            stageValues.append(ChartDataEntry(x: Double(hypno[index].0), y: Double(hypno[index].1)))
        }
        dataSets.append(createDataSet(values: stageValues))
        return dataSets
    }
}
