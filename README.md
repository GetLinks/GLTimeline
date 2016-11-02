# GLTimeline
GLTimeline is a simple timeline view implemented by UIView written in Swift 3.0 that original use in Getlinks Application Project.
![timeline](/screenshots/example-1.png "timeline example")
## Requirements
- iOS 8.0 or higher
- Swift 3.0

## Installation
- [CocoaPods](http://cocoapods.org/):
```ruby
pod "GLTimeline"
```

## Usage

### Import

```swift
import GLTimeline
```

### Integration
We recommend to use the timeline view in your storyboard. Just add a plain view and set the custom class and the module property to GLTimelineView.  
![storyboard](/screenshots/storyboard.png "storyboard")


###  Timeline Customization
`lineType` set type for each timelineview by pass indexPath and tableView into `getTimeLineType()`  
`lineColor` the color of  point and line  
`pointRadius` the point size  
`lineWidth` the width of line  

```swift
@IBOutlet weak var timeLineView: GLTimelineView!
timeLineView.lineType = GLTimelineView.getTimeLineType(position,items: numberOfItems)
timeLineView.lineColor  = UIColor.black
timeLineView.pointRadius = 5.0
timeLineView.lineWidth = 1.0
```

##[View Releases]("https://github.com/GetLinks/GLTimeline/releases")

If you Watch this repository, GitHub will send you an email every time I publish an update.

## License

GLTimeline is available under the MIT license. See the LICENSE file for more info.
