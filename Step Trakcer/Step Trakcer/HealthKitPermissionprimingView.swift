//
//  HealthKitPermissionprimingView.swift
//  Step Trakcer
//
//  Created by Cristina Andolfatto on 04/11/24.
//

import HealthKitUI
import SwiftUI

struct HealthKitPermissionprimingView: View {
    
    @Environment(HealthKitManager.self) private var hkManager
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingHealthkitPermission = false
    
    let description =
    """
This app displays your step and weight data in interactive charts.
    
You can also add new data to Apple Health from this app. Your data is private and secure
"""
    
    var body: some View {
        VStack(spacing: 130) {
            VStack(alignment: .leading) {
                Image(ImageResource.iconAppleHealth)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 12)
                Text("Apple Health Integration")
                    .font(.title2.bold())
                Text(description)
                    .foregroundStyle(.secondary)
            }
            Button("Connect Apple Health") {
                // TODO: connect to apple health
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(30)
        .healthDataAccessRequest(store: hkManager.store,
                                 shareTypes: hkManager.types,
                                 readTypes: hkManager.types,
                                 trigger: isShowingHealthkitPermission) { result in
            switch result {
                case .success(_):
                    dismiss()
                case .failure(_):
                    // TODO: handle the error
                    dismiss()
            }
        }
    }
}

#Preview {
    HealthKitPermissionprimingView()
        .environment(HealthKitManager())
}
