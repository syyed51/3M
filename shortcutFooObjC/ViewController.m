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
#import "Constants.h"
#define kTotallTimeIntervalForSession (60*2)      //time interval in seconds.

#define kCourseToPracticeAtIndex    0
#define kLevelToPractice            6
@interface ViewController(){
    BOOL start;
    QA* test;
    Level* level;
    NSTimer* timer;
    NSDate *timeSinceStarted;
    NSUInteger progress;
    NSUInteger countSuccess;
    NSUInteger countFailour;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timeSinceStarted = nil;
    countSuccess = 1;
    countFailour = 1;
    start = NO;
    //Get list of courses.
    NSArray * arrCourses = [[AppController sharedController] getCourses];
    //Select a course.
    Course * c = [arrCourses objectAtIndex:kCourseToPracticeAtIndex];
    
    //Load first level in the course.
    NSArray* levels = [[AppController sharedController] getLevelsCourse:c];
    
    //select level3
    level = [levels objectAtIndex:kLevelToPractice];
    
    NSMutableString * title = [NSMutableString string];
    [title appendFormat:@"%@\n\n",c.title];
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
    if (self.helpCBox.state == NSOnState){
        NSLog(@"Help is ON");
        if ([test.answer hasPrefix:@"^"]) {
            NSLog(@"carrot Charactor Founf");
        }
        self.inputLbl.placeholderString = test.answer;
    }else{
        NSLog(@"Help is ON");
        self.inputLbl.placeholderString = @"";
    }
}

- (IBAction)helpBA:(id)sender {
    [self loadRandomQuestion];
}

- (IBAction)startBA:(id)sender {
    if (self.startBtn.state == NSOnState) {
        self.resultLbl.stringValue = @"";
        timeSinceStarted = [NSDate date];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
        start = YES;
        NSLog(kTextStart);
        [self loadRandomQuestion];
    }else{
        [self resetState];
        [self levelCompleted];
        NSLog(kTextEnd);
    }
}
-(void)resetState{
    countFailour = 1;
    countSuccess = 1;
    self.progressBar.doubleValue = 0;
    [timer invalidate];
    timer = nil;
    
    start = NO;
    self.
    self.instructionsLbl.stringValue = @"";
    self.inputLbl.stringValue = @"";
    self.startBtn.state = NSOffState;
}
-(void)levelCompleted{
    NSMutableString * results = [NSMutableString new];
//    NSAttributedString * res = [NSAttributedString new];
    
    [results appendFormat:@"Correct    :%lu\n",(unsigned long)countSuccess];
    [results appendFormat:@"Incorrect  :%lu\n",(unsigned long)countFailour];
    [results appendFormat:@"Accuracy  :%lu \n",(unsigned long)countSuccess*100/(countFailour+countSuccess)];
    [results appendString:self.resultLbl.stringValue];
    self.resultLbl.stringValue = results;
    [self resetState];
}
-(void)updateProgress:(id)caller{
    NSDate * now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSinceDate:timeSinceStarted];
    NSUInteger timeLeftInMinutes = (kTotallTimeIntervalForSession-interval)/60;
    NSUInteger timeLeftInSeconds = (kTotallTimeIntervalForSession-interval);
    NSMutableString * timeLeft = [NSMutableString new];
    [timeLeft appendFormat:@"Time left %lu Minutes",(unsigned long)timeLeftInMinutes];
    if (timeLeftInSeconds>0)[timeLeft appendFormat:@" and %lu seconds",(unsigned long)timeLeftInSeconds%60];
    self.timerLbl.stringValue = timeLeft;
    double p = interval*100/kTotallTimeIntervalForSession;
    self.progressBar.doubleValue = p;
//    NSLog(@"Progress:%2.2f",self.progressBar.doubleValue);
    if (self.progressBar.doubleValue>=100) {
        [caller invalidate];
        [self levelCompleted];
        NSAlert * alert = [[NSAlert alloc]init];
        alert.messageText = @"Level Completed";
        alert.informativeText = @"Please revisit this level without help";
        [alert addButtonWithTitle:@"Ok"];
        [alert runModal];
    }
    
}
- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
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
            countSuccess++;
            [self loadRandomQuestion];
        }else{
            result = kTextFailed;
            NSMutableString * lbl =[NSMutableString stringWithFormat:@"%@\n",self.resultLbl.stringValue];
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@  %@    %@ = %@\n",result ,textField.stringValue, test.question,test.answer];
            [str appendString:lbl];
            self.resultLbl.stringValue = str;
            countFailour++;
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


- (BOOL)control:(NSControl *)control textView:(NSTextView *)fieldEditor doCommandBySelector:(SEL)commandSelector
{
    NSLog(@"Selector method is (%@)", NSStringFromSelector( commandSelector ) );
    if (commandSelector == @selector(insertNewline:)) {
        NSLog(@"@selector(insertNewline:)");
        NSString*specialCommand = [test.answer substringWithRange:NSMakeRange(0,[test.answer length] - 1)];
        NSString * result = @"";
        if ([specialCommand isEqualToString:self.inputLbl.stringValue]) {
            result = kTextSuccess;
            NSMutableString * lbl =[NSMutableString stringWithFormat:@"%@\n",self.resultLbl.stringValue];
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@  %@    %@\n",result, test.question ,test.answer];
            [str appendString:lbl];
            self.resultLbl.stringValue = str;
            
            [self loadRandomQuestion];
        }
        return NO;
        
    } else if (commandSelector == @selector(deleteForward:)) {
        NSLog(@"@selector(deleteForward:)");
        
    } else if (commandSelector == @selector(deleteBackward:)) {
        NSLog(@"@selector(deleteBackward:)");
        return NO;
        
    } else if (commandSelector == @selector(insertTab:)) {
               NSLog(@"@selector(insertTab:)");
    }
    
    return YES;
}


@end
