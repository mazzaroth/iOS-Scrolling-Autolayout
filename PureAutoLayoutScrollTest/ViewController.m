//
//  ViewController.m
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/8/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "Util.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *box0;
@property (weak, nonatomic) IBOutlet UIView *box1;
@property (weak, nonatomic) IBOutlet UIView *box2;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *containerView;
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil displayState:(VieweControllerDisplayState)vcState
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.displayState = vcState;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.containerView = [[UIView alloc] init];
    [self.view addSubview:self.containerView];
    
    [self.containerView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.scrollView setAlwaysBounceHorizontal:NO];
    [self.scrollView setAlwaysBounceVertical:YES];
    
    [self.containerView addSubview:self.scrollView];
    
    // Set the constraints for the scroll view and the image view.
    [self.scrollView alignLeading:@"20" trailing:@"-20" toView:self.containerView];
    [self.scrollView alignTop:@"65" bottom:@"-44" toView:self.containerView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints  = NO;

//    [self placeImageInScrollView];
    [self placeBoxesInScrollView];
    
    [UIView colorViewsRandomly:self.view];
    [UIView logViewRect:self.view level:0];
}

- (void)placeImageInScrollView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    
    // Add an image to the image view.
    [imageView setImage:[UIImage imageNamed:@"MyReallyBigImage.jpg"]];
    
    // Add the scroll view to our view.
    //    [self.view addSubview:self.scrollView];
    
    // Add the image view to the scroll view.
    [self.scrollView addSubview:imageView];
    
    // Set the translatesAutoresizingMaskIntoConstraints to NO so that the views autoresizing mask is not translated into auto layout constraints.
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //    UIScrollView *scrollView = self.scrollView;
    //    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scrollView, imageView);
    //    [self.scrollView alignLeading:@"0" trailing:@"0" toView:self.containerView];
    //    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:0 views:viewsDictionary]];
    
    //    [self.scrollView alignTop:@"65" bottom:@"-44" toView:self.containerView];
    //    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    
    [imageView alignLeading:@"0" trailing:@"0" toView:self.scrollView];
    //    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
    [imageView alignTop:@"0" bottom:@"0" toView:self.scrollView];
    //    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
}

- (void)placeBoxesInScrollView
{
    UIView *scrollBox = [[UIView alloc] init];
    
    // translatesAutoresizingMaskIntoConstraints is a transitionary attribute to help developers move from traditional auto resizing masks to
    // auto layout. They are set at runtime when "Use Autolayout" is checked in a xib file.
    // They tend to interfere with programmatic auto layout
    scrollBox.translatesAutoresizingMaskIntoConstraints = NO;

    // for new views translatesAutoresizingMaskIntoConstraints == YES so turn this off
    self.box0.translatesAutoresizingMaskIntoConstraints = NO;
    self.box1.translatesAutoresizingMaskIntoConstraints = NO;
    self.box2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:scrollBox];
    
    [UIView alignTopEdgesOfViews:@[self.scrollView, scrollBox]];
    [scrollBox alignLeading:@"0" trailing:@"0" toView:self.scrollView];
    [UIView equalWidthForViews:@[self.scrollView, scrollBox]];
    
    NSArray *boxes = @[self.box0, self.box1, self.box2];

    [scrollBox addSubview:self.box0];
    [scrollBox addSubview:self.box1];
    [scrollBox addSubview:self.box2];

    [boxes[0] constrainHeight:@">=263"];
    [boxes[0] alignLeading:@"0" trailing:@"0" toView:scrollBox];
    [UIView alignTopEdgesOfViews:@[boxes[0], scrollBox]];
    [UIView equalWidthForViews:boxes];
    [UIView equalHeightForViews:boxes];
    [UIView alignLeadingAndTrailingEdgesOfViews:boxes];
    [UIView spaceOutViewsVertically:boxes predicate:@"0"];
    
    [UIView alignBottomEdgesOfViews:@[scrollBox, boxes[2]]];
    [UIView colorViewsRandomly:scrollBox];
    [UIView logViewRect:self.view level:0];

    [self.scrollView alignBottomEdgeWithView:scrollBox predicate:@"0"];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [UIView logViewRect:self.view level:0];
}

@end
