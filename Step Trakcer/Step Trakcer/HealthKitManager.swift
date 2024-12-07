//
//  HealthKitManager.swift
//  Step Trakcer
//
//  Created by Cristina Andolfatto on 09/11/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {
    /// HealthKit Store: used to read and write data
    let store : HKHealthStore = HKHealthStore()
    /// Types of data we want to read and write into healthkit store
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
    
    /// Add Mocked Step and Weight Data
//    func addSimulatorData() async {
//        var mockSamples: [HKQuantitySample] = []
//        for i in 0..<28 {
//            // step quantity: random quantity btw 2000 and 10000
//            let stepQuantity: HKQuantity = HKQuantity(unit: .count(), doubleValue: .random(in: 2000...10000))
//            // weight quantity
//            let weightQuantity: HKQuantity = HKQuantity(unit: .pound(), doubleValue: .random(in: (160 + Double(i/3))...(165 + Double(i/3))))
//            // for each iteration, we start from today and we remove 1 day
//            let startDate = Calendar.current.date(byAdding: .day, value: -i, to: Date.now)
//            if let startDate = startDate {
//                let endDate = Calendar.current.date(byAdding: .second, value: 1, to: startDate)
//                if let endDate = endDate {
//                    // a single step sample
//                    let stepSample = HKQuantitySample(type: HKQuantityType(.stepCount), quantity: stepQuantity, start: startDate, end: endDate)
//                    // a single weight sample
//                    let weightSample = HKQuantitySample(type: HKQuantityType(.bodyMass), quantity: weightQuantity, start: startDate, end: endDate)
//                    // append the single samples to the mockSamples
//                    mockSamples.append(stepSample)
//                    mockSamples.append(weightSample)
//                }
//            }
//        }
//        // Try to save the samples to the store
//        try! await store.save(mockSamples)
//        print("Dummy data sent up")
//    }
}
