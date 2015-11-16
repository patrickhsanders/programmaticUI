//
//  ViewController.m
//  ProgrammaticUI
//
//  Created by Aditya Narayan on 11/16/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  UILabel *outputLabel;
  UISegmentedControl *segment;
  UIImageView *imageView;
  UIImage *imageToDisplay;
  UIButton *rectangle;
}
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 450 - 15, 40 , 450, 30)];
  outputLabel.text = @"Created at TurnToTech LLC.";
  outputLabel.font = [UIFont systemFontOfSize:24];
  outputLabel.textAlignment = UITextAlignmentCenter;
  [self.view addSubview:outputLabel];
  
  //dynamic button
  UIButton *dynamicButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 40, 150, 30)];
  [dynamicButton setTitle:@"Dynamic Button" forState:UIControlStateNormal];
  dynamicButton.backgroundColor = [UIColor blackColor];
  [dynamicButton addTarget:self action:@selector(dynamicButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:dynamicButton];
  
  //segment control
  segment = [[[UISegmentedControl alloc] initWithFrame:CGRectMake(10, 80, 300, 30) ] initWithItems:[NSArray arrayWithObjects:@"TurnToTech",@"Qcd", nil]];
  segment.backgroundColor = [UIColor redColor];
  [segment addTarget:self action:@selector(segmentControlChange:) forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:segment];
  
  imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 300 - 15, 80,300, 80)];
  imageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.view addSubview:imageView];
  
  UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 120, 400, 400)];
  scrollView.backgroundColor = [UIColor lightGrayColor];
  NSMutableString *contentText = [[NSMutableString alloc] init];
  for(int i = 0; i < 200; i++){
    [contentText appendString:@"битый небитого везет\n"];
  }
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 390, 1000)];
  label.lineBreakMode = NSLineBreakByWordWrapping;
  label.numberOfLines = 0;
  label.text = contentText;
  [scrollView addSubview:label];
  [scrollView setContentSize: label.frame.size];
  [self.view addSubview:scrollView];
  
  rectangle = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50, 30, 30)];
  rectangle.backgroundColor = [UIColor blackColor];
  [self.view addSubview:rectangle];
  
  [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
  [[NSNotificationCenter defaultCenter]
   addObserver:self selector:@selector(orientationChanged:)
   name:UIDeviceOrientationDidChangeNotification
   object:[UIDevice currentDevice]];
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)dynamicButtonPressed {
  outputLabel.text = @"User click of dynamic button";
  outputLabel.backgroundColor = [UIColor clearColor];
  outputLabel.font = [UIFont systemFontOfSize:24];
}

- (void)segmentControlChange:(id)sender {
  switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
    case 0:
      outputLabel.text = @"User click of TurnToTech button";
      outputLabel.backgroundColor = [UIColor redColor];
      outputLabel.font = [UIFont systemFontOfSize:24];
      imageToDisplay = [UIImage imageNamed:@"logo.png"];
      imageView.image = imageToDisplay;
      
      break;
    case 1:
      outputLabel.text = @"User click of QCD button";
      outputLabel.backgroundColor = [UIColor clearColor];
      outputLabel.font = [UIFont systemFontOfSize:24];
      imageToDisplay = [UIImage imageNamed:@"qcd.jpg"];
      imageView.image = imageToDisplay;
      break;
  }
}

- (void) orientationChanged:(NSNotification *)note
{
  UIDevice * device = note.object;
  switch(device.orientation)
  {
    case UIDeviceOrientationPortrait:
    case UIDeviceOrientationPortraitUpsideDown:
      if(self.view.bounds.size.width < self.view.bounds.size.height){
        rectangle.frame = CGRectMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50, 30, 30);
      } else {
        rectangle.frame = CGRectMake(self.view.bounds.size.height - 50, self.view.bounds.size.width - 50, 30, 30);
      }
      break;
    case UIDeviceOrientationLandscapeLeft:
    case UIDeviceOrientationLandscapeRight:
      if(self.view.bounds.size.width > self.view.bounds.size.height){
        rectangle.frame = CGRectMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50, 30, 30);
      } else {
        rectangle.frame = CGRectMake(self.view.bounds.size.height - 50, self.view.bounds.size.width - 50, 30, 30);
      }
      break;
  }
}

@end
