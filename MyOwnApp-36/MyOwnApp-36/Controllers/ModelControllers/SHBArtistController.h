//
//  SHBArtistController.h
//  MyOwnApp-36
//
//  Created by Shean Bjoralt on 10/1/20.
//

#import <Foundation/Foundation.h>
#import "SHBArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHBArtistController : NSObject

+ (instancetype)shared;

- (void)fetchArtistWithArtistName:(NSString *)searchTerm completion:(void (^)(SHBArtist *))completion;

@end

NS_ASSUME_NONNULL_END
