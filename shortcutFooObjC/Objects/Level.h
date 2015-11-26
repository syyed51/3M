//
//  Level.h
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import <Foundation/Foundation.h>
@class QA;
@interface Level : NSObject
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* detail;
@property(nonatomic, strong) NSArray* qAs;
-(QA*)getRandomQuestion;
@end
