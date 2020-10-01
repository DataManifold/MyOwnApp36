//
//  SHBArtist.h
//  MyOwnApp-36
//
//  Created by Shean Bjoralt on 10/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHBArtist : NSObject

@property (nonatomic, copy, readonly) NSString *yearBegan;
@property (nonatomic, copy, readonly) NSString *yearEnded;
@property (nonatomic, copy, readonly) NSString *locationBegan;

- (instancetype)initWithYearBeagan:(NSString *)yearBegan
                         yearEnded:(NSString *)yearEnded
                     locationBegan:(NSString *)locationBegan;

@end

@interface SHBArtist (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
