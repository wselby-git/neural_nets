// Author: William Selby
// simple neural network in swift

//import libraries
import Foundation
import UIKit

//define neural network class
class NeuralNetwork {
    
    //initialize variables
    var inputLayerSize:Int
    var hiddenLayerSize:Int
    var outputLayerSize:Int
    var weight1: [[Double]]
    var weight2: [[Double]]
    
    //initialize constructor
    init(inputLayerSize:Int,hiddenLayerSize:Int,outputLayerSize:Int) {
        self.inputLayerSize = inputLayerSize
        self.hiddenLayerSize = hiddenLayerSize
        self.outputLayerSize = outputLayerSize
        
        //initialize random weights using gaussian distribution
        self.weight1 = [[Double]](repeating: [Double](repeating: 0.0, count: hiddenLayerSize), count: inputLayerSize)
        self.weight2 = [[Double]](repeating: [Double](repeating: 0.0, count: outputLayerSize), count: hiddenLayerSize)
        for i in 0..<self.inputLayerSize {
            for j in 0..<self.hiddenLayerSize {
                self.weight1[i][j] = Double.random(in: -2.0...2.0)
            }
        }
        for i in 0..<self.hiddenLayerSize {
            for j in 0..<self.outputLayerSize {
                self.weight2[i][j] = Double.random(in: -2.0...2.0)
            }
        }
    }
    
    //define sigmoid activation function
    func sigmoid (_ x: Double) -> Double {
        return 1.0/(1.0 + exp(-x))
    }
    
    //define forward propagation function
    func forwardPropagation (_ inputVector: [Double]) -> [Double] {
        var hidden = [Double](repeating: 0.0, count: hiddenLayerSize)
        for i in 0..<hiddenLayerSize {
            for j in 0..<inputLayerSize {
                hidden[i] += (weight1[j][i] * inputVector[j])
            }
            hidden[i] = sigmoid(hidden[i])
        }
        var output = [Double](repeating: 0.0, count: outputLayerSize)
        for i in 0..<outputLayerSize {
            for j in 0..<hiddenLayerSize {
                output[i] += (weight2[j][i] * hidden[j])
            }
            output[i] = sigmoid(output[i])
        }
        return output
    }
    
}
