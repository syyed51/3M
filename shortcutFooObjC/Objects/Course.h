//
//  Course.h
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *identifier;
@property(nonatomic, strong)NSArray *QAs;
@end