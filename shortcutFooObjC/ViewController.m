//
//  ViewController.m
//  shortcutFooObjC
//
//  Created by Zain Syed on 24/11/2015.
//  Copyright (c) 2015 Zain Syed. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"
#import "Level.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Get list of courses.
    NSArray * arrCourses = [[AppController sharedController] getCourses];
    //Select a course.
    Course * c = [arrCourses firstObject];
    
    //Load first level in the course.
    Level* l1 = [[AppController sharedController] getLevelsCourse:c];
    
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)startBA:(id)sender {
    NSLog(@"startBA");
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    NSLog(@"%@", [textField stringValue]);
}

@end
