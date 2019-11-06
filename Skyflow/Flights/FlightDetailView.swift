//
//  FlightDetailView.swift
//  Skyflow
//
//  Created by Luis Zapata on 16-10-19.
//  Copyright © 2019 Luis Zapata. All rights reserved.
//

import SwiftUI

struct FlightDetailView: View {
    var flight: Flight
    
    var body: some View {
        NavigationLink(destination: Text(flight.name)){
            Image(systemName: "photo")
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(flight.name)
                Text("\(flight.capacity) people")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#if DEBUG

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView(flight: testData[0])
    }
}
#endif
