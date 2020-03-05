//
//  VerizonWrapper.h
//  VerizonFramework
//
//  Created by Beacon-QA on 25/02/20.
//  Copyright © 2020 Infy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JitsiMeet/JitsiMeet.h"

NS_ASSUME_NONNULL_BEGIN


@protocol VerizonVideoCallViewDelegate <NSObject>

@optional

/**
 * Called when a conference was joined.
 *
 * The `data` dictionary contains a `url` key with the conference URL.
 */
- (void)verizonConferenceJoined:(NSDictionary *)data;

- (void)verizonConferenceTerminated:(NSDictionary *)data;

- (void)verizonConferenceWillJoin:(NSDictionary *)data;

- (void)verizonEnterPictureInPicture:(NSDictionary *)data;

@end

@interface VerizonWrapper : NSObject<JitsiMeetViewDelegate>
{
    JitsiMeetView *jitsiView;
}

@property (nonatomic, copy, nullable) NSString *serverURL;
@property (nonatomic, copy, nullable) NSString *room;
@property (nonatomic, copy, nullable) NSString *subject;
@property (nonatomic, copy, nullable) NSString *token;
@property (nonatomic, assign) BOOL audioOnly;
@property (nonatomic, assign) BOOL audioMuted;
@property (nonatomic, assign) BOOL videoMuted;
@property (nonatomic) BOOL welcomePageEnabled;
@property (nonatomic, nullable) JitsiMeetUserInfo *userInfo;
@property (nonatomic, nullable, weak) id<VerizonVideoCallViewDelegate> delegate;

- (void) initilizeVerizonBridgeParameters;
- (void)joinVerizonChatRoom:(UIView *)parentView;
- (void)leaveerizonChatRoom;

@end

NS_ASSUME_NONNULL_END

