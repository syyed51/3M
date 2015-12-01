//
//  3MTextField.m
//  
//
//  Created by Zain Syed on 30/11/2015.
//
//

#import "3MTextField.h"

@implementation _MTextField
-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.input = [InputObj new];
        self.objectStrength = 1;
    }
    return self;
}




- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    if ([textField.stringValue length] == [self objectStrength]) {
        InputObj * input = [InputObj new];
        input.inputField = textField;
        input.inputType = kInputTypeString;
        [self processInput:input];
    }
}
- (void)cancelOperation:(id)sender{
        InputObj * input = [InputObj new];
        input.inputType = kInputTypeESC;
        [self processInput:input];
}
- (BOOL)control:(NSControl *)control textView:(NSTextView *)fieldEditor doCommandBySelector:(SEL)commandSelector{
    NSLog(@"Selector method is (%@)", NSStringFromSelector( commandSelector ) );
    InputObj * input = [InputObj new];
    input.inputField = fieldEditor;
    
    if (commandSelector == @selector(insertNewline:)) {
        
    } else if (commandSelector == @selector(deleteForward:)) {
        
    } else if (commandSelector == @selector(deleteBackward:)) {

        
    } else if (commandSelector == @selector(insertTab:)) {

    }
    [self processInput:input];
    return YES;
}

-(void)processInput:(InputObj*)input{
    
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
