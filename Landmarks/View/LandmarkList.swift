//
//  LandmarkList.swift
//  Landmarks
//
//  Created by MacBook Pro on 19/04/24.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    var body: some View {
        
        var filteredLandmarks: [Landmark] {
            landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
