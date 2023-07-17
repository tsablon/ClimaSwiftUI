//
//  WeatherListViewModel.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    
    //MARK: - Variables
    @Published var weatherList: [Weather] = []
    
    @Published var fetchCompleted: Bool = false
    @Published var loadingCompleted: Bool = false
    @Published var hasError: Bool = false
    
    @Published var progressValue: Int = 0

    @Published var message: String
    
    private var fetchTimer : Timer?
    private var messageTimer : Timer?
    private var loadingTimer : Timer?
    
    private var fetchCounter: Int = 0
    private var messageCounter: Int = 0

    private let cities = ["Paris","Rennes","Lyon","Bordeaux","Marseille"]
    private let loadingMessage = ["Nous téléchargeons les données…","C’est presque fini…","Plus que quelques secondes avant d’avoir le résultat…"]
    

    private let weatherService: WeatherServiceProtocol
    
    // MARK: - Lifecycle
    
    init(service: WeatherServiceProtocol = WeatherService()) {

        self.message = loadingMessage[0]
        self.weatherService = service
    }
    
    func reset() {
        
        print("reset")

        self.message = loadingMessage[0]
        self.progressValue = 0
        self.messageCounter = 1

        self.hasError = false
        self.loadingCompleted = false
        
        messageTimer?.invalidate()
        loadingTimer?.invalidate()
        fetchTimer?.invalidate()
    }
    
    // MARK: - Loading  functions
    
    func startLoading() {
        displayLoadingMessage()
        loadingProgressView()
    
    }

    func loadingProgressView() {
        loadingTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireLoading(_ :)), userInfo: nil, repeats: true)
    }
    
    func displayLoadingMessage() {
        messageCounter = 1
        messageTimer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(fireMessage(_ :)), userInfo: nil, repeats: true)
    }
    
    
    @objc private func fireLoading(_ timer: Timer) {
        if progressValue == 60 {
            print("loading completed")
            loadingCompleted = true
            timer.invalidate()
        } else {
            progressValue += 1
        }
    }
    
    
    @objc private func fireMessage(_ timer: Timer) {

        if loadingCompleted {
            timer.invalidate()
        } else {
            message = loadingMessage[messageCounter]
            print("message fired:", message)
            
            if messageCounter == loadingMessage.count - 1 {
                messageCounter = 0
            } else {
                messageCounter += 1
            }
        }
    }
    
    //MARK: - Fetch data functions
    
    @MainActor
    private func getWeatherByCity(_ cityName: String) async {
        let weatherData = await weatherService.request(city: cityName)
        switch weatherData {
        case .success(let weatherData):
            
            weatherList.append(weatherData)

        case .failure(let error):
            reset()
            hasError = true
            print(error.localizedDescription)
        }
    }
    
}
