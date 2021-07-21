//
//  ContentView.swift
//  exercise
//
//  Created by Codecamp on 21.07.21.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Pie Chart")
            Spacer()
            PieChart(entries: Wine.entriesForWines(Wine.allWines, category: .variety))
            Spacer()
            TransactionBarChartView(entries: WineTransaction.dataEntriesForYear(2019, transactions: WineTransaction.allTransactions))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
