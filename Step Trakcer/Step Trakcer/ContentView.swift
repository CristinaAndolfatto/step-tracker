//
//  ContentView.swift
//  Step Trakcer
//
//  Created by Cristina Andolfatto on 27/10/24.
//

import SwiftUI

enum HealthMetricContext: CaseIterable, Identifiable {
    var id: Self { self }
    case step, weight
    
    var title: String {
        switch self {
        case .step:
            return "Steps"
        case .weight:
            return "Weight"
        }
    }
}


struct ContentView: View {
    
    @State private var selectedStat: HealthMetricContext = .step
    var isStepSelected : Bool { selectedStat == .step }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                Picker("Selected Stat", selection: $selectedStat) {
                    ForEach(HealthMetricContext.allCases) { metric in
                        Text(metric.title)
                    }
                }
                .pickerStyle(.palette)
                VStack(spacing: 20) {
                    VStack {
                        NavigationLink(value: selectedStat) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Label("Steps", systemImage: "figure.walk")
                                        .font(.title3.bold())
                                        .foregroundStyle(.pink)
                                    Text("Avg: 10K Steps")
                                        .font(.caption)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(.bottom, 12)
                        }
                        .foregroundStyle(.secondary)
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Label("Averages", systemImage: "calendar")
                                .font(.title3.bold())
                                .foregroundStyle(.pink)
                            Text("Last 28 days")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }
                .padding()
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthMetricContext.self) { metric in
                Text(metric.title)
            }
        }
        .tint(isStepSelected ? .pink : .indigo)
    }
}

#Preview {
    ContentView()
}
