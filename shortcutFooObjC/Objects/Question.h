//
//  Question.h
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property(nonatomic, strong) NSString* question;
@property(nonatomic, strong) NSString* answer;
@property(nonatomic, strong) NSString* hint;
@property(nonatomic, strong) NSString* qid;
@end
