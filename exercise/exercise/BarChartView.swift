//
//  BarChartView.swift
//  exercise
//
//  Created by Codecamp on 21.07.21.
//

import SwiftUI
import Charts

struct TransactionBarChartView: UIViewRepresentable {
    let entries: [BarChartDataEntry]
    let barChart = BarChartView()
    
    func makeUIView(context: Context) -> BarChartView {
        return barChart
    }
    
    func updateUIView(_ uiView: BarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.label = "Treffen"
        uiView.noDataText = "Keine Begegnung jetzt"
        uiView.data = BarChartData(dataSet: dataSet)
        uiView.rightAxis.enabled = false
        uiView.setScaleEnabled(false)
        formatDataSet(dataSet: dataSet)
        formatLeftAxis(leftAxis: uiView.leftAxis)
        formatXAis(xAxis: uiView.xAxis)
        formatLegend(legend: uiView.legend)
        uiView.notifyDataSetChanged()
    }
    
    func formatDataSet(dataSet: BarChartDataSet) {
        dataSet.colors = [.cyan]
        dataSet.valueColors = [.black]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
    func formatLeftAxis(leftAxis: YAxis){
        leftAxis.labelTextColor = .black
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        leftAxis.axisMinimum = 0
    }
    
    func formatXAis(xAxis: XAxis){
        //change the xAxis to readable String
        xAxis.valueFormatter = IndexAxisValueFormatter(values: WineTransaction.months)
        // put it in bottom
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .black
    }
    
    func formatLegend(legend: Legend) {
        legend.textColor = .black
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
        legend.drawInside = true
        legend.yOffset = 30.0
    }
    
    

}

struct TransactionBarChartView_Previews: PreviewProvider{
    static var previews: some View{
        TransactionBarChartView(entries: WineTransaction.dataEntriesForYear(2019, transactions: WineTransaction.allTransactions))
    }
}
