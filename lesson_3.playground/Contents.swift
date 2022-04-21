import UIKit

var greeting = "Hello, playground"

enum EngineCondition: String {
    case launched = "Двигатель заведен"
    case switchedOff = "Двигатель выключен"
    case broken = "Двигатель сломан"
}

enum WindowsCondition: String {
    case opened = "Окна открыты"
    case closed = "Окна закрыты"
}

struct SportCar {
    let defaultTrunkVolume: Int
    let carModel: String
    let productionYear: Int
    var windowsCondition: WindowsCondition
    var engineCondition: EngineCondition
    var filledTrunkVolume: Int
    var carMileage: Int

    mutating func openWindows() {
        self.windowsCondition = .opened
        print(windowsCondition.rawValue)
    }
    
    mutating func closeWindows() {
        self.windowsCondition = .closed
        print(windowsCondition.rawValue)
    }
    
    mutating func launchEngine() {
        self.engineCondition = .launched
        print(engineCondition.rawValue)
    }
    
    mutating func switchOffEngine() {
        self.engineCondition = .switchedOff
        print(engineCondition.rawValue)
    }
    
    mutating func loadIntoTrunk(volumeOfLoadingCargo: Int) {
        var freeTrunkVolume = defaultTrunkVolume - filledTrunkVolume
        if freeTrunkVolume >= volumeOfLoadingCargo {
            self.filledTrunkVolume = filledTrunkVolume + volumeOfLoadingCargo
            print("Готово, теперь в багажнике \(filledTrunkVolume) литра")
        } else {
            var needVolume = filledTrunkVolume + volumeOfLoadingCargo - defaultTrunkVolume
            print("В багажнике недостаточно места для этого груза! Чтобы уместилось все, освободи \(needVolume) литра")
        }
    }
    
    mutating func unloadFromTrunk(volumeOfUnloadingCargo: Int) {
        if filledTrunkVolume >= volumeOfUnloadingCargo {
            self.filledTrunkVolume = filledTrunkVolume - volumeOfUnloadingCargo
            print("Готово, теперь в багажнике \(filledTrunkVolume) литра")
        } else {
           print("В багажнике не так много груза... Ты сможешь выгрузить не более \(filledTrunkVolume) литра")
        }
    }
    
    mutating func goStreetRacing(duratationInMinutes: Int) {
        if duratationInMinutes > 30 || carMileage > 10000 {
            self.engineCondition = .broken
            print("О нет, двигатель сломался!")
        } else {
            self.carMileage += 1000
            print("Отличная гонка! Будь внимателен: пробег равен уже \(carMileage) километров")
        }
    }
    
    mutating func technicalInspection() {
        if self.engineCondition == .broken {
            self.engineCondition = .switchedOff
            print("Двигатель был сломан, но его починили. Будьте аккуратнее!")
        } else {
            print("Машина в отличном состоянии!")
        }
    }
}

var bmw = SportCar(defaultTrunkVolume: 300, carModel: "Модель1", productionYear: 2017, windowsCondition: .opened, engineCondition: .broken, filledTrunkVolume: 20, carMileage: 0)

bmw.goStreetRacing(duratationInMinutes: 20)
bmw.goStreetRacing(duratationInMinutes: 40)
bmw.technicalInspection()

bmw.loadIntoTrunk(volumeOfLoadingCargo: 400)
bmw.unloadFromTrunk(volumeOfUnloadingCargo: 300)
bmw.openWindows()
bmw.closeWindows()
