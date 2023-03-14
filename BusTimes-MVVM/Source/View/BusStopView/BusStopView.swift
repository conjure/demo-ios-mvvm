//
//  LocalBusStopView.swift
//  BusTimes-MVVM
//
//  Created by Ade Adegoke on 05/02/2023.
//

import SwiftUI
import Combine

struct BusStopView: View {
    
    @State private var selectedBusStop: BusStop?
    @StateObject private var viewModel =  BusStopViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<viewModel.busStops.count, id: \.self) { index in
                        let busStop = viewModel.busStops[index]
                        BusStopRow(busStop: busStop)
                            .onTapGesture {
                                self.selectedBusStop = busStop
                            }
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Bus stops")
            .sheet(item: $selectedBusStop) { busStop in
                ArrivalTimeView(busTopID: busStop.naptanId)
            }
        }
    }
}
