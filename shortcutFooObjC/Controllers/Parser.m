//
//  Parser.m
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import "Parser.h"
#import "Course.h"
#import "Level.h"
#import "QA.h"

#define kTagCourses @"courses"
#define kTagTitle @"title"
#define kTagDescription @"Description"
#define kTagCourseId @"courseid"
#define kTagCourseFileName @"coursefilename"
#define kTagLevels @"Levels"
#define kTagQAs     @"QAs"
#define kTagID      @"id"
#define kTagQuestion      @"question"
#define kTagAnswer      @"key"


@implementation Parser
-(NSArray*)parseCourses{
    NSDictionary *dcourses = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]
                                                                     pathForResource:kFileNameCourses
                                                                     ofType:kPlist]];
    NSArray * acourses = [dcourses objectForKey:kTagCourses];
    NSMutableArray *courses = [NSMutableArray array];
    for (NSDictionary * d in acourses) {
        Course * c = [self parseCourse:d];
        [courses addObject:c];
    }
    return courses;
}
-(Course*)parseCourse:(NSDictionary*)course{
    Course * c = [[Course alloc]init];
    c.title = [course objectForKey:kTagTitle];
    c.detail = [course objectForKey:kTagDescription];
    c.coursefilename = [course objectForKey:kTagCourseFileName];
    c.identifier = [course objectForKey:kTagCourseId];
    return c;
}

-(NSArray*)parseLevelsInCourse:(Course*)course{
    NSDictionary *dlevels = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]
                                                                         pathForResource:course.coursefilename
                                                                         ofType:kPlist]];
    NSArray * alevels = [dlevels objectForKey:kTagLevels];
    
    NSMutableArray *levels = [NSMutableArray array];
    for (NSDictionary * l in alevels) {
        Level * c = [self parseLevel:l];
        [levels addObject:c];
    }
    return levels;

}

-(Level*)parseLevel:(NSDictionary*)level{
    Level * l = [[Level alloc]init];
    l.title = [level objectForKey:kTagTitle];
    NSMutableArray * arr = [NSMutableArray array];
    for (NSDictionary* d in [level objectForKey:kTagQAs]) {
        QA* qa = [self parseQuestionAnswer:d];
        [arr addObject:qa];
    }
    l.qAs = arr;
    return l;
}
-(QA*)parseQuestionAnswer:(NSDictionary*)questionsDictonary{
    QA * qa = [QA new];
    
    qa.question = [questionsDictonary objectForKey:kTagQuestion];
    qa.qid = [questionsDictonary objectForKey:kTagID];
    qa.answer = [questionsDictonary objectForKey:kTagAnswer];
    return qa;
}
@end
