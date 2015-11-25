//
//  Parser.h
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import <Foundation/Foundation.h>
#import "Constants.h"
@class Course;
@interface Parser : NSObject
-(NSArray*)parseCourses;
-(NSArray*)parseLevelsInCourse:(Course*)course;
@end
