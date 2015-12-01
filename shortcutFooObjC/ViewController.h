//
//  ViewController.h
//  shortcutFooObjC
//
//  Created by Zain Syed on 24/11/2015.
//  Copyright (c) 2015 Zain Syed. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppController.h"
@interface ViewController : NSViewController<NSTextFieldDelegate>
@property (weak) IBOutlet NSButton *helpCBox;
@property (weak) IBOutlet NSButton *startBtn;
@property (weak) IBOutlet NSTextField *titleLbl;
@property (weak) IBOutlet NSTextField *instructionsLbl;
@property (weak) IBOutlet NSTextField *inputLbl;
@property (weak) IBOutlet NSTextField *resultLbl;


- (IBAction)helpBA:(id)sender;
- (IBAction)startBA:(id)sender;
-(void)loadRandomQuestion;
@end

