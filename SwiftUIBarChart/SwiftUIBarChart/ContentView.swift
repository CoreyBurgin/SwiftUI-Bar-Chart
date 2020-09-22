//
//  ContentView.swift
//  SwiftUIBarChart
//
//  Created by Corey Burgin on 9/22/20.
//

import SwiftUI

struct ContentView: View {
    @State var pickerselectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        
      [50, 100, 150, 100, 12],
      [69, 75, 100, 150, 122],
      [100, 150, 200, 20, 65],
      [50, 70, 110, 50, 120],
      
    ]
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.05490196078, green: 0.1647058824, blue: 0.3333333333, alpha: 1)).edgesIgnoringSafeArea(.all)
          
            
            VStack {
                Text("Code Coffee Culture")
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
               Text("Podcast Streams")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(.white)
                
                
                Picker(selection: $pickerselectedItem, label: Text("")) {
                    Text("Week 1").tag(0)
                    Text("Week 2").tag(1)
                    Text("Week 3").tag(2)
                    Text("Week 4").tag(3)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 25)
                
                
                HStack (spacing: 15){
                    BarView(value: dataPoints[pickerselectedItem][0], day: "Mon")
                    BarView(value: dataPoints[pickerselectedItem][1], day: "Tues")
                    BarView(value: dataPoints[pickerselectedItem][2], day: "Wed")
                    BarView(value: dataPoints[pickerselectedItem][3], day: "Thu")
                    BarView(value: dataPoints[pickerselectedItem][4], day: "Fri")
                    
                }.padding(.top, 25)
                    .animation(.easeIn)
            
            
        }
    }
}




struct BarView: View {
    
    var value: CGFloat
    var day: String
    
    var body: some View {
        
        VStack{
           ZStack (alignment: .bottom) {
            Capsule().frame(width: 30, height: 200)
             .foregroundColor(Color(#colorLiteral(red: 0.9193093181, green: 0.9095336795, blue: 0.857663691, alpha: 0.2532641267)))
              Capsule().frame(width: 30, height: value)
            .foregroundColor(Color(#colorLiteral(red: 0.9992555976, green: 0.6710371375, blue: 0.1107554957, alpha: 1)))
                }
            Text(day).padding(.horizontal, 8)
                .foregroundColor(.white)
             }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
