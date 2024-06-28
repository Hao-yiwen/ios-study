//
//  User.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/28.
//

#ifndef User_h
#define User_h

@interface User : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSNumber* age;

-(instancetype)initWithName:(NSString *)name email:(NSString *)email age:(NSNumber *)age;
@end

#endif /* User_h */
