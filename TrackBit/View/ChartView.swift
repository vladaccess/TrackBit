//
//  ChartView.swift
//  TrackBit
//
//  Created by Vladislav on 15.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import Charts

class ChartView:LineChartView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNoData()
        setupLeftAxis()
        setupRightAxis()
        
        rightAxis.enabled = false
        chartDescription?.enabled = false
        isUserInteractionEnabled = false
        legend.enabled = false
    }
    
    func setData(_ values:[ChartDataEntry]) {
        var data = LineChartData()
        var line = getDataSet(values)
        data.addDataSet(line)
        self.data = data
    }
    
    
    func getDataSet(_ values:[ChartDataEntry]) -> LineChartDataSet {
        var line = LineChartDataSet(values: values, label: nil)
        line.drawCirclesEnabled = false
        line.drawValuesEnabled = false
        line.valueTextColor = UIColor.purple
        return line
    }
    
    func setupNoData() {
        noDataFont = UIFont.systemFont(ofSize: 20)
        noDataTextColor = UIColor.black
    }
    
    func setupLeftAxis() {
        setupAxis(leftAxis)
        leftAxis.labelFont = UIFont.systemFont(ofSize: 10)
        leftAxis.valueFormatter = DefaultAxisValueFormatter.init(block: { (value, _) -> String in
            Float(value).toCurrency(0) ?? " "
        })
    }
    
    func setupAxis(_ baseAxis:AxisBase) {
        baseAxis.gridColor = UIColor.lightGray
        baseAxis.labelTextColor = UIColor.purple
        baseAxis.axisLineColor = UIColor.clear
    }
    
    
    func setupRightAxis() {
        setupAxis(xAxis)
        xAxis.labelPosition = .bottom
        xAxis.labelFont = UIFont.boldSystemFont(ofSize: 9)
        xAxis.valueFormatter = DefaultAxisValueFormatter.init(block: { (value, _) -> String in
            Date(timeIntervalSince1970: value).toString("yy-MM-dd")
        })
    }
    

}
