//
//  ViewController.h
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/8/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VieweControllerDisplayState)
{
    ViewControllerImageScrollingState,
    ViewControllerStackedBoxesState
};

@interface ViewController : UIViewController
@property (nonatomic) VieweControllerDisplayState displayState;
@end
