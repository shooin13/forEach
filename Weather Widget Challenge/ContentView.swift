import SwiftUI

struct ContentView: View {
  let weather = Weather()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20.0) {
      TodayConditions()
      
      Divider()
      
      HStack {
        ForEach(weather.hourlyForecast, id: \.hour) { forecast in
          Spacer()
          ForecastView(forecast: forecast)
          Spacer()
        }
      }
    }
    
    
    .padding()
    .foregroundColor(.white)
    .background(
      Color("lightBlue")
    )
  }
}


struct Weather {
  struct Forecast {
    let hour: String
    let conditions: Image
    let temperature: String
  }
  
  let hourlyForecast = [
    Forecast(hour: "8AM", conditions: Image(systemName: "sun.max.fill"), temperature: "63°"),
    Forecast(hour: "9AM", conditions: Image(systemName: "cloud.sun.fill"), temperature: "63°"),
    Forecast(hour: "10AM", conditions: Image(systemName: "sun.max.fill"), temperature: "64°"),
    Forecast(hour: "11AM", conditions: Image(systemName: "cloud.fill"), temperature: "61°"),
    Forecast(hour: "12PM", conditions: Image(systemName: "cloud.rain.fill"), temperature: "62°")
  ]
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Image("challenge")
      .resizable()
      .scaledToFit()
      .previewLayout(.sizeThatFits)
    
    ContentView()
      .previewLayout(.sizeThatFits)
  }
}

struct TodayConditions: View {
  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      VStack(alignment: .leading) {
        Text("Cupertino")
          .font(.title3)
        Text("63°")
          .font(.largeTitle)
      }
      Spacer()
      VStack(alignment: .trailing) {
        Image(systemName: "sun.max.fill")
          .renderingMode(.original)
        Text("Sunny")
        Text("H:68° L:42°")
      }
    }
  }
}


struct ForecastView: View {
  let forecast: Weather.Forecast
  var body: some View {
    VStack {
      Text(forecast.hour)
      forecast.conditions
        .renderingMode(.original)
        .frame(height: 20)
      Text(forecast.temperature)
    }
  }
}
