//
//  PieChart.swift
//  PieChart
//
//  Created by Codecamp on 20.07.21.
//

import Charts
import SwiftUI

struct PieChart: UIViewRepresentable {
    var entries: [PieChartDataEntry]
    
    let pieChart = PieChartView()
    
    func makeUIView(context: Context) -> PieChartView {
        pieChart.delegate = context.coordinator
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = ChartColorTemplates.colorful()
        let pieChartData = PieChartData(dataSet: dataSet)
        uiView.data = pieChartData
        configureChart(uiView)
        formatCenter(uiView)
        formatDescription(uiView.chartDescription)
        formatLegend(uiView.legend)
        formatDataSet(dataSet)
        uiView.notifyDataSetChanged()
    }
    
    class Coordinator: NSObject, ChartViewDelegate{
        var parent: PieChart
        init(parent: PieChart){
            self.parent = parent
        }
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            let labelText = entry.value(forKey: "label")! as! String
            let num = Int(entry.value(forKey: "value")! as! Double)
            parent.pieChart.centerText = """
                \(labelText)
                \(num)
                """
            
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func configureChart(_ pieChart: PieChartView){
        pieChart.rotationEnabled = false
        pieChart.animate(xAxisDuration: 0.5, easingOption: .easeInCirc)
        pieChart.drawEntryLabelsEnabled = false
        pieChart.highlightValue(x: -1, dataSetIndex: 0, callDelegate: false)
        
    }
    
    func formatCenter(_ pieChart: PieChartView){
        pieChart.holeColor = UIColor.systemBackground
        pieChart.centerText = "Wie oft mit einem \n Person treffen?"
        pieChart.centerTextRadiusPercent = 0.95
    }
    
    func formatDescription(_ description: Description){
        description.text = "Often"
        description.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func formatLegend(_ legend: Legend){
        legend.enabled = false
    }
    
    func formatDataSet(_ data: ChartDataSet){
        data.drawValuesEnabled = false
    }
    
}

struct PieChart_Previews : PreviewProvider {
    static var previews: some View{
        PieChart(entries: Wine.entriesForWines(Wine.allWines, category: .variety))
            .frame(height:400)
    }
}

