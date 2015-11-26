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
#import "QA.h"
#define kTextSuccess @"Success !"
#define kTextFailed @"Failed !"
#define kTextStart @"Start"
#define kTextEnd    @"End"
@interface ViewController(){
    BOOL start;
    QA* test;
    Level* level;
@private

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    start = NO;
    //Get list of courses.
    NSArray * arrCourses = [[AppController sharedController] getCourses];
    //Select a course.
    Course * c = [arrCourses firstObject];
    
    //Load first level in the course.
    NSArray* levels = [[AppController sharedController] getLevelsCourse:c];
    
    //select level1
    level = [levels objectAtIndex:2];
    
    NSMutableString * title = [NSMutableString string];
    [title appendFormat:@"%@\n",c.title];
    [title appendString:level.title];
    self.titleLbl.stringValue = title;
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}
-(void)loadRandomQuestion{
    self.inputLbl.stringValue = @"";
    test = [level getRandomQuestion];
    self.instructionsLbl.stringValue = test.question;
    self.inputLbl.placeholderString = test.answer;
}
- (IBAction)startBA:(id)sender {
    if ([self.startBtn.title isEqualToString:kTextStart]) {
        start = YES;
        NSLog(kTextStart);
        self.startBtn.title = kTextEnd;
        [self loadRandomQuestion];
    }else{
        start = NO;
        NSLog(kTextEnd);
        self.startBtn.title = kTextStart;
        self.instructionsLbl.stringValue = @"";
        self.inputLbl.stringValue = @"";
    }
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    NSString * text = [textField.stringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"controlTextDidChange:%@", [textField stringValue]);
    NSString * result = @"";
    if (!start)return;
    if ([textField.stringValue length] == [test.answer length]) {
        if ([textField.stringValue isEqualToString:test.answer]) {
            result = kTextSuccess;
            NSMutableString * lbl =[NSMutableString stringWithFormat:@"%@\n",self.resultLbl.stringValue];
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@  %@    %@\n",result, test.question , textField.stringValue];
            [str appendString:lbl];
            self.resultLbl.stringValue = str;
            
            [self loadRandomQuestion];
        }else{
            result = kTextFailed;
            NSMutableString * lbl =[NSMutableString stringWithFormat:@"%@\n",self.resultLbl.stringValue];
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@  %@    %@ = %@\n",result ,textField.stringValue, test.question,test.answer];
            [str appendString:lbl];
            self.resultLbl.stringValue = str;
            
            [self loadRandomQuestion];
            
        }
    }
}

#pragma mark    -   NSResponder
- (void)cancelOperation:(id)sender
{
        NSString * result = @"";
    if ([test.answer isEqualToString:@"ESC"]) {
        result = kTextSuccess;
        NSMutableString * lbl =[NSMutableString stringWithFormat:@"%@\n",self.resultLbl.stringValue];
        NSMutableString* str = [NSMutableString stringWithFormat:@"%@  %@    %@\n",result, test.question , @"ESC"];
        [str appendString:lbl];
        self.resultLbl.stringValue = str;
        
        [self loadRandomQuestion];
    }
    NSLog(@"Cancel Operation");
}

@end
