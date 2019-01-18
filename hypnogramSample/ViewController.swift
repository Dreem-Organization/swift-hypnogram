//
//  ViewController.swift
//  hypnogramSample
//
//  Created by Adrien Catanas on 04/07/2018.
//  Copyright © 2018 Rythm. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {
    @IBOutlet weak var hypnogramChartView: LineChartView!
    private var hypnogram: Hypnogram!
    private var hypnogramArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        setupChart()
        setData()
    }
    
    private func setData() {
        hypnogram = Hypnogram.init(basicHypno: hypnogramArray)
        let data = LineChartData.init(dataSets: hypnogram.getDataSets(hypno: hypnogram.getHypnoWithPoints()))
        hypnogramChartView.data = data
    }
    
    private func setupChart() {
        hypnogramChartView.delegate = self
        hypnogramChartView.highlightPerTapEnabled = false
        hypnogramChartView.highlightPerDragEnabled = false
        hypnogramChartView.xAxis.drawGridLinesEnabled = false
        hypnogramChartView.leftAxis.drawGridLinesEnabled = false
        hypnogramChartView.chartDescription?.enabled = false
        hypnogramChartView.xAxis.drawLabelsEnabled = false
        hypnogramChartView.rightAxis.drawAxisLineEnabled = false
        hypnogramChartView.rightAxis.drawGridLinesEnabled = false
        hypnogramChartView.rightAxis.drawLabelsEnabled = false
        hypnogramChartView.legend.enabled = false
        hypnogramChartView.doubleTapToZoomEnabled = false
        hypnogramChartView.minOffset = 0.0
        hypnogramChartView.pinchZoomEnabled = false
        
        
        // Customise Axis
        hypnogramChartView.leftAxis.granularity = 1.0
        hypnogramChartView.leftAxis.valueFormatter = StagesAxisValueFormatter()
        hypnogramChartView.leftAxis.drawAxisLineEnabled = true
        hypnogramChartView.leftAxis.drawLabelsEnabled = true
        hypnogramChartView.leftAxis.labelTextColor = UIColor.white
        hypnogramChartView.leftAxis.axisLineColor = UIColor.white
        hypnogramChartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        
        hypnogramChartView.xAxis.labelPosition = .bottom
        hypnogramChartView.xAxis.drawAxisLineEnabled = true
        hypnogramChartView.xAxis.drawLabelsEnabled = true
        hypnogramChartView.xAxis.valueFormatter = HoursAxisValueFormatter.init(startHour: "00:00")
        hypnogramChartView.xAxis.labelTextColor = UIColor.white
        hypnogramChartView.xAxis.axisLineColor = UIColor.white
        hypnogramChartView.xAxis.labelFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        
        hypnogramChartView.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

