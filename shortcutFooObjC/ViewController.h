//
//  ViewController.h
//  shortcutFooObjC
//
//  Created by Zain Syed on 24/11/2015.
//  Copyright (c) 2015 Zain Syed. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTextFieldDelegate>
@property (weak) IBOutlet NSButton *startBtn;
@property (weak) IBOutlet NSTextField *instructionsLbl;
@property (weak) IBOutlet NSTextField *inputLbl;
@property (weak) IBOutlet NSTextField *resultLbl;


- (IBAction)startBA:(id)sender;

@end

