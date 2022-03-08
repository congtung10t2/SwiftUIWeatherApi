//
//  WeatherSceneView.swift
//  NabTest
//
//  Created by tungdev on 27/02/2022.
//  Copyright (c) 2022. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel(weatherApi: WeatherImp())
    @State private var searchText = ""
    @State private var showAlert = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack {
                    Image("search")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 36)
                        .padding([.leading, .top, .bottom], 5)
                    TextField("", text: $searchText, prompt: Text("Search"))
                    Spacer()
                    Button(action: {
                        guard searchText.count >= 3 else {
                            showAlert = true
                            return
                        }
                        viewModel.fetchWeather(city: searchText)
                        
                    }, label: {
                        Text("Go")
                    })
                    .padding(.all, 5)
                    .alert("Can't find the city, the keywords are too short", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                }.padding([.top, .bottom], 5)
            }
            .background(Color.black.opacity(0.1))
            .clipped()
            .cornerRadius(8)
            .padding(.all, 12)
            .frame(height: 64)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<listItems.count, id: \.self) { i in
                    VStack(alignment: .leading) {
                        Text(Calendar.current.weekdaySymbols[i])
                            .font(.title)
                        WeatherItemView(model: listItems[i])
                    }
                    
                }
            }
        }
        .padding([.leading], 10)
        
    }
    var listItems: [WeatherDetails] {
        viewModel.model?.list ?? []
    }
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
