# iOS-Unity-AR
How to use Unity 3D within an iOS Swift app Xcode 9 or Later

I have added additional things to be done while interating Unity 5 with your swift project. Although this have not been possible without help of www.the-nerd.be, Frederik Jacques and https://github.com/blitzagency/ios-unity5. Everything is same as they have mentioned but some additional tweek ins which made be integrating the Unity easier and thought if this can help someone else who is in same situation.

This covers Unity 5+. At the time of this writing this has been successfully used with Unity 5.6.2 and Swift 4.0 under Xcode 9 Beta 5(As my code involves ARKit which is supported for higher versions of iPhones).

FOR ANY FURTHER DOCUMENTATION, PLEASE REFER https://github.com/blitzagency/ios-unity5


Lets get started.

From Unity

Considering you already have Unity project created and it builds for latest iOS versions.

From Xcode

There is a bit more to do here,

Refer UnityProjectRefresh.sh(https://github.com/blitzagency/ios-unity5) and add its content to Run Script under your Project Target settings-> Build Phases-> New Run Script Phase 
![Alt text](/Users/u576321/Desktop?raw=true "Title")

I have modified Unity.xcconfig(attached) to my convinience although it is same what is mentioned by https://github.com/blitzagency/ios-unity5

