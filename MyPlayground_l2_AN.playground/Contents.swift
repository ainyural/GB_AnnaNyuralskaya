import Foundation

// Task 1

func definitionOfTheParityOfANumber(inputNumberParity: Int) {
    var remainder = inputNumberParity % 2
    
    switch remainder {
    case 0: print("Число четное")
    case _ where remainder > 0: print("Число нечетное")
    default: break
    }
}

definitionOfTheParityOfANumber(inputNumberParity: 12)

// Task 2

func determiningTheDivisibilityOfANumberByThree(inputNumberThree: Int) {
    var remainder = inputNumberThree % 3
    
    switch remainder {
    case 0: print("Число делится без остатка на 3")
    case _ where remainder > 0: print("Число не делится без остатка на 3")
    default: break
    }
}

determiningTheDivisibilityOfANumberByThree(inputNumberThree: 11)

// Task 3

var basicMassive: [ Int ] = []

for upIndex in 1...100 {
    basicMassive.append(upIndex)
}

// Task 4

print(basicMassive)

var num: Int = basicMassive.count - 1
 while num >= 0  {
     var leftAfterDivisionTwo: Int = basicMassive[num]%2
     var leftAfterDivisionThree: Int = basicMassive[num]%3
     if leftAfterDivisionTwo == 0 || leftAfterDivisionThree != 0 { basicMassive.remove(at: num) }
     num = num - 1
 }

print(basicMassive)

// Task 5

var massiveFibonacci: [ Int ] = [0, 1]
func addFibonacci() {
    var lastIndex = massiveFibonacci.count - 1
    var penultIndex = lastIndex - 1
    var newElement = massiveFibonacci[lastIndex] + massiveFibonacci[penultIndex]
    massiveFibonacci.append(newElement)
}
var scoreIndex = 0
while scoreIndex <= 90 {
    addFibonacci()
    scoreIndex += 1
}

print(massiveFibonacci)

// Task 6

var defaultNumbers: [ Int ] = []
var countIndex: Int = 45
for upIndex in 2...countIndex {
    defaultNumbers.append(upIndex)
}

print(defaultNumbers)

var step: Int = 2
var lastIndex: Int = defaultNumbers.count - 1
var nextIndex: Int = 0
var lastElement: Int = defaultNumbers.last ?? 0

while nextIndex + step <= lastIndex {
    print(nextIndex)
    print("след индекс в начале")
    while nextIndex + step <= lastIndex {
        nextIndex += step
        defaultNumbers.remove(at: nextIndex)
        lastIndex = defaultNumbers.count - 1
    }
        for nextStep in defaultNumbers {
                if nextStep > step {
                    step = nextStep
                    break
                }
        }
}

print(defaultNumbers)
