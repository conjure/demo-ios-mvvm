//
//  ArrivalTimeView.swift
//  BusTimes-MVVM
//
//  Created by Ade Adegoke on 12/02/2023.
//

import SwiftUI

struct ArrivalTimeView: View {
    @StateObject private var viewModel = ArrivalTimeViewModel()
    var busTopID: String
    
    init(busTopID: String) {
        self.busTopID = busTopID
    }
    
    var body: some View {
        
        VStack {
            NavigationView {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<viewModel.arrivalTime.count, id: \.self) { i in
                            let arrivalTime = viewModel.arrivalTime[i]
                            ArriveTimeRow(arrivalTime: arrivalTime)
                            
                        }
                    }
                }
                .navigationTitle("Arrival Times")
                .padding(.top, 10)
                .onAppear {
                    viewModel.getBussesArivalTimes(for: busTopID)
                }
            }
        }
    }
}
