# react-native-heading
Get device heading information on iOS or Android

## What
Report back device orientation in degrees, 0-360, with 0 being North.

### Example
```javascript
import { NativeEventEmitter } from 'react-native';
import Heading from 'react-native-heading';

//...
componentDidMount = () => {
    this.listener = new NativeEventEmitter(Heading);
    Heading.start(1);
		.then(didStart => {
			this.setState({ headingIsSupported: didStart });
		});
	
    this.listener.addListener('headingUpdated', heading => {
    	console.log('New heading is:', heading);
	});
}

componentWillUnmount() {
  	Heading.stop();
  	this.listener.removeAllListeners('headingUpdated');
}
//...
```
### API
`start(filter)` - Start receiving heading updates. Accepts an optional filter param (int) to ignore heading changes less than the spcified threshold. The default value is 5. Returns a promise which can be used to determine if heading updates are suported by the device.

`stop` - Stop receiving heaing updates (don't forget to remove the `headingUpdated` listener)

## Setup
```
yarn add https://github.com/mertozylmz/react-native-heading
```

### iOS
* Add pod file `pod 'react-native-heading', :path => '../node_modules/react-native-heading'`
* pod install

### Android
##### Step 1 - Update Gradle Settings

```
// file: android/settings.gradle
...

include ':react-native-heading'
project(':react-native-heading').projectDir = new File(rootProject.projectDir, '../node_modules/@zsajjad/react-native-heading/android')
```
##### Step 2 - Update Gradle Build

```
// file: android/app/build.gradle
...

dependencies {
    ...
    compile project(':react-native-heading')
}
```
##### Step 3 - Register React Package
```
...
import com.joshblour.reactnativeheading.ReactNativeHeadingPackage; // <--- import

public class MainActivity extends ReactActivity {

    ...

    @Override
    protected List<ReactPackage> getPackages() {
        return Arrays.<ReactPackage>asList(
            new MainReactPackage(),
            new ReactNativeHeadingPackage() // <------ add the package
        );
    }

    ...
}
```