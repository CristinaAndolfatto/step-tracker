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
}
