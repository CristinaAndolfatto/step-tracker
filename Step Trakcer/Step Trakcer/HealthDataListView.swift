//
//  HealthDataListView.swift
//  Step Trakcer
//
//  Created by Cristina Andolfatto on 02/11/24.
//

import SwiftUI

struct HealthDataListView: View {
    @State private var isShowingAddData = false
    @State private var addDataDate: Date = .now
    @State private var valueToAdd: String = ""
    @Binding var selectedStat: HealthMetricContext
    var metric: HealthMetricContext
    
    var body: some View {
        List(0..<28) { i in
            HStack {
                Text(Date(), format: .dateTime.month().day().year())
                Spacer()
                Text(10000, format: .number.precision(.fractionLength(metric == .step ? 0 : 1))) // we want different format of decimal places if the number is weight or step
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar {
            Button("Add Data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
        .tint(selectedStat == .step ? .pink : .indigo)
    }
    
    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker("Select Date", 
                           selection: $addDataDate,
                           displayedComponents: [.date]
                )
                HStack {
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                        .keyboardType(metric == .step ? .numberPad : .decimalPad)
                }
            }
            .navigationTitle(metric.title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") {
                        isShowingAddData = false
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") {
                        // TODO: add data
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(selectedStat: .constant(.step), metric: HealthMetricContext.step)
    }
}
