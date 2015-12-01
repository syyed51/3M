//
//  InputObj.h
//  
//
//  Created by Zain Syed on 01/12/2015.
//
//

#import <Foundation/Foundation.h>
typedef enum _inputType{
    kInputTypeString = 0,
    kInputTypeESC,
    kInputTypeNewline,
    kInputTypeDeleteFWD,
    kInputTypeDeleteBCK,
    kInputTypeTab,
    kInputTypeArrowKeyUp,
    kInputTypeArrowKeyDown,
    kInputTypeArrowKeyLeft,
    kInputTypeArrowKeyRight,
    kInputTypeUnknown
    
}InputType;

@interface InputObj : NSObject
@property(nonatomic, assign)InputType inputType;
@property(nonatomic, assign)id inputField;
@end
