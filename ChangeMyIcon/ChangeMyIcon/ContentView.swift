//
//  ContentView.swift
//  ChangeMyIcon
//
//  Created by RapidWolf on 4/30/22.
//

import SwiftUI

struct ContentView: View {
    let iconsList: [String : String] = ["AppIcon1":"Icon1", "AppIcon2":"Icon2"]
    let defaultAppIcon = "AppIconDefault"
    let defaultIconName = "CustomIconDefault"
    
    var body: some View {
        VStack {
            Text("Choose An Icon")
                .font(.largeTitle).bold()
            
            List {
                Button {
                    changeIcon(defaultAppIcon)
                } label: {
                        Text("Default Icon")
                            .bold()
                            .foregroundColor(.white)
                }
                
                ForEach(iconsList.sorted(by: <), id: \.key) { iconID, iconName in
                    Button {
                        changeIcon(iconID)
                    } label: {
                        Text(iconName)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    func changeIcon(_ iconID: String) {
        print("Tapped icon \(iconID)")
        if UIApplication.shared.supportsAlternateIcons {
            // Change icon
            if iconID != defaultAppIcon {
                UIApplication.shared.setAlternateIconName(iconID) { error in
                    if let error = error {
                        print("ERROR: Could not set custom icon \(iconID). \(error)")
                        print(error.localizedDescription)
                    }
                }
            } else {
                UIApplication.shared.setAlternateIconName(nil) { error in
                    if let error = error {
                        print("ERROR: Could not set custom icon \(iconID). \(error)")
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            print("Error: Icon changes not supported")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
