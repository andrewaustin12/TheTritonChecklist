
import Foundation

class AppViewModel: ObservableObject {
    // PreAssembly 1 View Model
    @Published var preAssembly1ViewModel = PreAssembly1ViewModel()
    
    // PreAssembly 2 View Model
    @Published var preAssembly2ViewModel = PreAssembly2ViewModel()
    
    // PreAssembly 3 View Model
    @Published var preAssembly3ViewModel = PreAssembly3ViewModel()
    
    // PreAssembly 4 View Model
    @Published var preAssembly4ViewModel = PreAssembly4ViewModel()
    
    // Assembly Counterlungs View Model
    @Published var assemblyCounterlungsViewModel = AssemblyCounterlungsViewModel()
    
    // Assembly Loop View Model
    @Published var assemblyLoopViewModel = AssemblyLoopViewModel()
    
    // Assembly Gas Line View Model
    @Published var assemblyGasLineViewModel = AssemblyGasLineViewModel()
    
    // Assembly Electronics View Model
    @Published var assemblyElectronicsViewModel = AssemblyElectronicsViewModel()
    
    // Assembly PosNeg Test View Model
    @Published var assemblyPosNegTestViewModel = AssemblyPosNegTestViewModel()
    
    // Assembly Calibration View Model
    @Published var assemblyCalibrationViewModel = AssemblyCalibrationViewModel()
    
    // Assembly BcdAdv View Model
    @Published var assemblyBcdAdvViewModel = AssemblyBcdAdvViewModel()
    
    // Add a computed property to check if all steps are completed
    var areAllStepsCompleted: Bool {
        print("Debugging areAllStepsCompleted")
        
        let allStepsCompleted =
        // PreAssembly View 1
        preAssembly1ViewModel.isComputerOnChecked &&
        preAssembly1ViewModel.isComputerBatteryChecked &&
        !preAssembly1ViewModel.computerVolts.isEmpty &&
        preAssembly1ViewModel.isMonoxInstalledChecked &&
        preAssembly1ViewModel.isSensorCalibrationAirChecked &&
        !preAssembly1ViewModel.cell1Air.isEmpty &&
        !preAssembly1ViewModel.cell2Air.isEmpty &&
        !preAssembly1ViewModel.cell3Air.isEmpty &&
        
        // PreAssembly View 2
        preAssembly2ViewModel.isO2CylinderAnalyzedChecked &&
        !preAssembly2ViewModel.o2CylinderAnalyzed.isEmpty &&
        preAssembly2ViewModel.isO2CylinderPressureCheckChecked &&
        !preAssembly2ViewModel.o2CylinderPressure.isEmpty &&
        preAssembly2ViewModel.isCmfFlowChecked &&
        !preAssembly2ViewModel.cmfFlow.isEmpty &&
        
        // PreAssembly View 3
        preAssembly3ViewModel.isDilBailPercentLabelChecked &&
        !preAssembly3ViewModel.DilBailAnalyzed.isEmpty &&
        preAssembly3ViewModel.isDilBailPressureCheckChecked &&
        !preAssembly3ViewModel.DilBailPressure.isEmpty &&
        
        // PreAssembly View 4
        preAssembly4ViewModel.isScrubberFilledChecked &&
        preAssembly4ViewModel.isCanisterOringsInspectedChecked &&
        preAssembly4ViewModel.isCanisterClosedLabeledChecked &&
        
        // Assembly Counterlungs View 5
        assemblyCounterlungsViewModel.isExhaleFittingChecked &&
        assemblyCounterlungsViewModel.isInhaleFittingChecked &&
        assemblyCounterlungsViewModel.isCanisterCounterlungConnectedChecked &&
        
        // Assembly Loop View 6
        assemblyLoopViewModel.isMouthpieceInspectedChecked &&
        assemblyLoopViewModel.isHosesMushroomValvedInpectedChecked &&
        assemblyLoopViewModel.isMushroomSealInspectedChecked &&
        assemblyLoopViewModel.isCounterlungConnectedChecked &&
        
        // Assebly Gas Line View 7
        assemblyGasLineViewModel.isAdvToCounterlungChecked &&
        assemblyGasLineViewModel.isFirstStageAttachedChecked &&
        assemblyGasLineViewModel.isOxygenCylinderFittedChecked &&
        
        // Assembly Electronics View 8
        assemblyElectronicsViewModel.isCellHousingConnectedChecked &&
        
        // Assembly Pos Neg Test View 9
        assemblyPosNegTestViewModel.isPosTestCompleteChecked &&
        assemblyPosNegTestViewModel.isNegTestCompleteChecked &&
        
        // Assembly Calibration View
        assemblyCalibrationViewModel.isOxygenFlushCompletedChecked &&
        !assemblyCalibrationViewModel.oxygenFlushPercent.isEmpty &&
        assemblyCalibrationViewModel.isCalibrationCompleteChecked &&
        
        // Assembly Bcd Adv View
        assemblyBcdAdvViewModel.isAdvBcdConnectedChecked &&
        assemblyBcdAdvViewModel.isAdvFunctionChecked
        
        print("All Steps Completed: \(allStepsCompleted)")
        return allStepsCompleted
    }
    
    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        
        if !preAssembly1ViewModel.isComputerOnChecked { steps.append(1) }
        if !preAssembly1ViewModel.isComputerBatteryChecked { steps.append(2) }
        if preAssembly1ViewModel.computerVolts.isEmpty { steps.append(2) }
        if !preAssembly1ViewModel.isMonoxInstalledChecked { steps.append(3) }
        if !preAssembly1ViewModel.isSensorCalibrationAirChecked { steps.append(4) }
        if preAssembly1ViewModel.cell1Air.isEmpty { steps.append(4) }
        if preAssembly1ViewModel.cell2Air.isEmpty { steps.append(4) }
        if preAssembly1ViewModel.cell3Air.isEmpty { steps.append(4) }
        if !preAssembly2ViewModel.isO2CylinderAnalyzedChecked { steps.append(5) }
        if preAssembly2ViewModel.o2CylinderAnalyzed.isEmpty { steps.append(5) }
        if !preAssembly2ViewModel.isO2CylinderPressureCheckChecked { steps.append(6) }
        if preAssembly2ViewModel.o2CylinderPressure.isEmpty { steps.append(6) }
        if !preAssembly2ViewModel.isCmfFlowChecked { steps.append(7) }
        if preAssembly2ViewModel.cmfFlow.isEmpty { steps.append(7) }
        if !preAssembly3ViewModel.isDilBailPercentLabelChecked { steps.append(8) }
        if preAssembly3ViewModel.DilBailAnalyzed.isEmpty { steps.append(8) }
        if !preAssembly3ViewModel.isDilBailPressureCheckChecked  { steps.append(9) }
        if preAssembly3ViewModel.DilBailPressure.isEmpty { steps.append(9) }
        if !preAssembly4ViewModel.isScrubberFilledChecked { steps.append(10) }
        if !preAssembly4ViewModel.isCanisterOringsInspectedChecked { steps.append(11) }
        if !preAssembly4ViewModel.isCanisterClosedLabeledChecked { steps.append(12) }
        if !assemblyCounterlungsViewModel.isExhaleFittingChecked { steps.append(13) }
        if !assemblyCounterlungsViewModel.isInhaleFittingChecked { steps.append(14) }
        if !assemblyCounterlungsViewModel.isCanisterCounterlungConnectedChecked { steps.append(15) }
        if !assemblyLoopViewModel.isMouthpieceInspectedChecked { steps.append(16) }
        if !assemblyLoopViewModel.isHosesMushroomValvedInpectedChecked { steps.append(17) }
        if !assemblyLoopViewModel.isMushroomSealInspectedChecked { steps.append(18) }
        if !assemblyLoopViewModel.isCounterlungConnectedChecked { steps.append(19) }
        if !assemblyGasLineViewModel.isAdvToCounterlungChecked { steps.append(20) }
        if !assemblyGasLineViewModel.isFirstStageAttachedChecked { steps.append(21) }
        if !assemblyGasLineViewModel.isOxygenCylinderFittedChecked { steps.append(22) }
        if !assemblyElectronicsViewModel.isCellHousingConnectedChecked { steps.append(23) }
        if !assemblyPosNegTestViewModel.isPosTestCompleteChecked { steps.append(24) }
        if !assemblyPosNegTestViewModel.isNegTestCompleteChecked { steps.append(25) }
        if !assemblyCalibrationViewModel.isOxygenFlushCompletedChecked { steps.append(26) }
        if assemblyCalibrationViewModel.oxygenFlushPercent.isEmpty { steps.append(26) }
        if !assemblyCalibrationViewModel.isCalibrationCompleteChecked { steps.append(27) }
        if !assemblyBcdAdvViewModel.isAdvBcdConnectedChecked { steps.append(28) }
        if !assemblyBcdAdvViewModel.isAdvFunctionChecked { steps.append(29) }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...29 {
            if !incompleteSteps.contains(step) {
                completed.append(step)
            }
        }
        return completed
    }
}


// ViewModel for PreAssembly 1 View
class PreAssembly1ViewModel: ObservableObject {
    @Published var isComputerOnChecked = false
    @Published var isComputerBatteryChecked = false
    @Published var computerVolts = ""
    @Published var isMonoxInstalledChecked = false
    @Published var isSensorCalibrationAirChecked = false
    @Published var cell1Air = ""
    @Published var cell2Air = ""
    @Published var cell3Air = ""
}

// ViewModel for PreAssembly 2 View
class PreAssembly2ViewModel: ObservableObject {
    @Published var isO2CylinderAnalyzedChecked = false
    @Published var o2CylinderAnalyzed = ""
    @Published var isO2CylinderPressureCheckChecked = false
    @Published var o2CylinderPressure = ""
    @Published var isCmfFlowChecked = false
    @Published var cmfFlow = ""
    
}

// ViewModel for PreAssembly 3 View
class PreAssembly3ViewModel: ObservableObject {
    @Published var isDilBailPercentLabelChecked = false
    @Published var DilBailAnalyzed = ""
    @Published var isDilBailPressureCheckChecked = false
    @Published var DilBailPressure = ""
    
}

// ViewModel for PreAssembly 4 View
class PreAssembly4ViewModel: ObservableObject {
    @Published var isScrubberFilledChecked = false
    @Published var isCanisterOringsInspectedChecked = false
    @Published var isCanisterClosedLabeledChecked = false
}

// ViewModel for Assembly Counterlungs View
class AssemblyCounterlungsViewModel: ObservableObject {
    @Published var isExhaleFittingChecked = false
    @Published var isInhaleFittingChecked = false
    @Published var isCanisterCounterlungConnectedChecked = false
}

// ViewModel for Assembly Loop View
class AssemblyLoopViewModel: ObservableObject {
    @Published var isMouthpieceInspectedChecked = false
    @Published var isHosesMushroomValvedInpectedChecked = false
    @Published var isMushroomSealInspectedChecked = false
    @Published var isCounterlungConnectedChecked = false
}

// ViewModel for Assembly Gas Line View
class AssemblyGasLineViewModel: ObservableObject {
    @Published var isAdvToCounterlungChecked = false
    @Published var isFirstStageAttachedChecked = false
    @Published var isOxygenCylinderFittedChecked = false
}

// ViewModel for Assembly Electronics View
class AssemblyElectronicsViewModel: ObservableObject {
    @Published var isCellHousingConnectedChecked = false
}

// ViewModel for Assembly PosNeg Test View
class AssemblyPosNegTestViewModel: ObservableObject {
    @Published var isPosTestCompleteChecked = false
    @Published var isNegTestCompleteChecked = false
}

// ViewModel for Assembly Calibration View
class AssemblyCalibrationViewModel: ObservableObject {
    @Published var isOxygenFlushCompletedChecked = false
    @Published var oxygenFlushPercent = ""
    @Published var isCalibrationCompleteChecked = false
}

// ViewModel for Assembly BcdAdv View
class AssemblyBcdAdvViewModel: ObservableObject {
    @Published var isAdvBcdConnectedChecked = false
    @Published var isAdvFunctionChecked = false
}
