# iOS-Unity-AR
How to use Unity 3D within an iOS Swift app Xcode 9 or Later

I have added additional things to be done while interating Unity 5 with your swift project. Although this have not been possible without help of www.the-nerd.be, Frederik Jacques and https://github.com/blitzagency/ios-unity5. Everything is same as they have mentioned but some additional tweek ins which made be integrating the Unity easier and thought if this can help someone else who is in same situation.

This covers Unity 5+. At the time of this writing this has been successfully used with Unity 5.6.2 and Swift 4.0 under Xcode 9 Beta 5(As my code involves ARKit which is supported for higher versions of iPhones).

FOR ANY FURTHER DOCUMENTATION, PLEASE REFER https://github.com/blitzagency/ios-unity5


Lets get started.

From Unity

Considering you already have Unity project created and it builds for latest iOS versions. Copy the full Unity project and paste it inside you Xcode directory structure.

From Xcode

There is a bit more to do here,

Refer UnityProjectRefresh.sh(https://github.com/blitzagency/ios-unity5) and add its CONTENT to Run Script under your Project Target settings-> Build Phases-> New Run Script Phase 

I have modified Unity.xcconfig(attached) to my convinience although it is same what is mentioned by https://github.com/blitzagency/ios-unity5. 

Go to Link Binary With Libraries under build phases and add below frameworks:
* -libiconv.2.tbd
* -libiPhone-lib.a (Inside your Unity Libraries- Dereference and add it again if error occurs)
* CoreMotion (Optional)
* GameKit 
* iAd (Optional)
* CoreGraphics 
* AVFoundation 
* CoreVideo 
* CoreMedia 
* SystemConfiguration 
* CoreLocation 
* MediaToolBox 
* MediaPlayer 
* CFNetwork 
* AssetsLibrary 
* AudioToolbox 
* OpenAL 
* QuartzCore 
* Security 
* OpenGLES 
* UIKit 
* Foundation
* ARKit (Incase you have Unity AR)
* Metal (Same as above)

Next, Under Project Target settings-> Build Phases-> Compile Sources add all .mm and .cpp Unity classes, considering you already removed below files as suggested in https://github.com/blitzagency/ios-unity5:

Clean up your unity project

This is all in the www.the-nerd.be video as well 7:35 - There is two location we will clean up for convenience. For both of these we ONLY WANT TO REMOVE REFERENCES DO NOT MOVE TO TRASH

We don't need the Unity/Classes/Native/*.h and we don't need Unity/Libraries/libl2cpp/.

The Unity.xcconfig we applied knows where they are for compiling purposes.

Remove Unity/Libraries/libl2cpp/ 7:35 - 7:50 in www.the-nerd.be video.
Remove Unity/Classes/Native/*.h 7:55- 8:44 in www.the-nerd.be video.

Next, you need to add Header and Library search Paths which is automatically taken care by Unity.xcconfig. The only modification I did in Library search path is added $(inherited), dont know but for some reason I could able to resolve the lib errors.

More settings I did:
Under Project Target settings-> Build Settings->
* C Language Dialect -> GNU99
* C++ Language Dialect -> GNU++11
* C++ Standard Library -> libc++
* Objective-C Bridging Header -> $(PRODUCT_NAME)-Bridging-Header.h (Considering you already created bridging header while importing Unity classes)

Next, Under $(PRODUCT_NAME)-Bridging-Header.h import below classes:
* #import "UnityUtils.h"
* #import "UnityAppController.h"
* #import "UnityInterface.h"

Follow steps of renaming main in main.mm to anything else as suggested in https://github.com/blitzagency/ios-unity5 untill end. 

Some changes I made to AppDelegate is by creating my own UIApplicationMain(Attached main.swift) and commenting/removing the @UIApplicationMain in AppDelegate.swift as under:

```javascript
import UIKit

// @UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
```

Rest everything is same. Happy Coding!

Some debug point's still be taken into consideration if you got errors when your currentUnityController call breaks:
* Swift Compiler - Language-> Swift Laguage Version-> Swift 3.2 ( It seems to be an issue with Swift classes in general not being key value coding-compliant, whereas Objective-C classes almost always are because most are a subclass of NSObject)
* If you want to continue to use Swift 4.0, only you need to do is:
@objc var currentUnityController: UnityAppController?
In Swift 4.0, when you need to access the swift code in the ObjectC code you have to put "@objc" before the attribute.

I would like to thanks @igoredington and @eric-krikey for helping me with those errors.

