//
//  TwentyFourHourForecastView.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/12/24.
//

import SwiftUI

struct TwentyFourHourForecastView: View {
    let forecasts: [HourlyForecast]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "clock")
                Text("24-hour forecast")
                Spacer()
            }
            .font(.system(size: 14))
            .opacity(0.75)
            
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top){
                    ForEach(forecasts, id: \.hour) { forecast in
                        HourItemView(forecast: forecast)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight:120)
        }
        .padding(8)
        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
        .cornerRadius(8)
    }
}

private struct HourItemView: View {
    let forecast: HourlyForecast
    
    var body: some View {
        let windSpeed = String(format: "%.1f", forecast.wind)
        
        VStack(spacing: 8) {
            Text("\(forecast.temp)°")
            Image(systemName: forecast.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
            Text("\(windSpeed)km/h")
                .font(.system(size: 12))
            Text(forecast.hour)
        }
        .padding(8)
        
    }
}


struct TwentyFourHourForecastView_Previews: PreviewProvider {
    static var previews: some View {
        TwentyFourHourForecastView(forecasts: CurrentWeatherDataStore.sample.hourlyForecasts)
            .foregroundStyle(.white)
            .background(.black)
            .previewLayout(.sizeThatFits)
    }
}
