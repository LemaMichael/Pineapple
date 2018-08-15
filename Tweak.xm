//: forward declaring classes
@class SBFMobileKeyBagState;
@class PCPersistentTimer;
@class SBFMobileKeyBagState;
@class PCSimpleTimer;

@interface PCPersistentTimer : NSObject {
	double _fireTime;
	double _startTime;
	unsigned long long _guidancePriority;
	double _minimumEarlyFireProportion;
	BOOL _triggerOnGMTChange;
	BOOL _disableSystemWaking;
	BOOL _userVisible;
	NSString* _serviceIdentifier;
	id _target;
	SEL _selector;
	id _userInfo;
	PCSimpleTimer* _simpleTimer;
}
+(id)_backgroundUpdateQueue;
+(void)_updateTime:(double)arg1 forGuidancePriority:(unsigned long long)arg2 ;
+(double)currentMachTimeInterval;
+(double)_currentGuidanceTime;
+(id)lastSystemWakeDate;
-(double)fireTime;
-(void)interfaceManagerInternetReachabilityChanged:(id)arg1 ;
-(void)interfaceManagerWWANInterfaceChangedPowerState:(id)arg1 ;
-(void)interfaceManagerWWANInterfaceStatusChanged:(id)arg1 ;
-(id)_initWithAbsoluteTime:(double)arg1 serviceIdentifier:(id)arg2 guidancePriority:(unsigned long long)arg3 target:(id)arg4 selector:(SEL)arg5 userInfo:(id)arg6 triggerOnGMTChange:(BOOL)arg7 ;
-(void)_updateTimers;
-(void)scheduleInRunLoop:(id)arg1 inMode:(id)arg2 ;
-(void)_fireTimerFired;
-(BOOL)firingIsImminent;
-(double)_nextForcedAlignmentAbsoluteTime;
-(double)_earlyFireTime;
-(void)cutPowerMonitorBatteryConnectedStateDidChange:(id)arg1 ;
-(id)initWithTimeInterval:(double)arg1 serviceIdentifier:(id)arg2 guidancePriority:(unsigned long long)arg3 target:(id)arg4 selector:(SEL)arg5 userInfo:(id)arg6 ;
-(double)minimumEarlyFireProportion;
-(BOOL)disableSystemWaking;
-(void)invalidate;
-(void)dealloc;
-(NSString *)debugDescription;
-(BOOL)isValid;
-(id)userInfo;
-(double)startTime;
-(void)setDisableSystemWaking:(BOOL)arg1 ;
-(BOOL)isUserVisible;
-(id)initWithTimeInterval:(double)arg1 serviceIdentifier:(id)arg2 target:(id)arg3 selector:(SEL)arg4 userInfo:(id)arg5 ;
-(void)setUserVisible:(BOOL)arg1 ;
-(void)scheduleInRunLoop:(id)arg1 ;
-(void)scheduleInQueue:(id)arg1 ;
-(void)setMinimumEarlyFireProportion:(double)arg1 ;
-(id)initWithFireDate:(id)arg1 serviceIdentifier:(id)arg2 target:(id)arg3 selector:(SEL)arg4 userInfo:(id)arg5 ;
@end

%hook PCPersistentTimer
//: called at boot, returnVal: <OS_dispatch_queue: PCPersistentTimer-sharedBackgroundUpdateQueue[0x1748fcb00]>
+(id)_backgroundUpdateQueue {
	id val = %orig;
	HBLogDebug(@"_backgroundUpdateQueue, returnVal: %@", val);
	return val;
}
+(void)_updateTime:(double)arg1 forGuidancePriority:(unsigned long long)arg2  {
	HBLogDebug(@"_updateTime, arg1: %f, arg2: %lld", arg1, arg2);
	%orig;
}
//: called at boot, returnVal: 125809.833708
//: called at boot again, returnVal: 125810.492353
//: called yet again, returnVal: 125810.493949
//: called again, returnVal: 125812.312047
//: called again, returnVal: 125812.331484
+(double)currentMachTimeInterval {
	double val = %orig;
	HBLogDebug(@"currentMachTimeInterval, returnVal: %f", val);
	return val;
}
+(double)_currentGuidanceTime {
	double val = %orig;
	HBLogDebug(@"_currentGuidanceTime, returnVal: %f", val);
	return val;
}
//: called at boot, returnVal: 2018-08-14 23:46:12 +0000
//: called again, returnVal: 2018-08-14 23:46:12 +0000
+(id)lastSystemWakeDate {
	id val = %orig;
	HBLogDebug(@"lastSystemWakeDate, returnVal: %@", val);
	return val;
}
-(double)fireTime {
	double val = %orig;
	HBLogDebug(@"fireTime, returnVal: %f", val);
	return val;
}
-(void)interfaceManagerInternetReachabilityChanged:(id)arg1  {
	HBLogDebug(@"interfaceManagerInternetReachabilityChanged, arg1: %@", arg1);
	%orig;
}
-(void)interfaceManagerWWANInterfaceChangedPowerState:(id)arg1 {
	HBLogDebug(@"interfaceManagerWWANInterfaceChangedPowerState, arg1: %@", arg1);
	%orig;
}
-(void)interfaceManagerWWANInterfaceStatusChanged:(id)arg1  {
	HBLogDebug(@"interfaceManagerWWANInterfaceStatusChanged, arg1: %@", arg1);
	%orig;
}
//: Called at boot, arg1: 556027200.000000, arg2: com.apple.mobiletimer, arg3: -1, arg4: <UNSLocalNotificationClient: 0x17468da20>, arg5: _queue_triggerDidFireForTimer:, arg6: (null), arg7: 0, returnVal: <PCPersistentTimer: 0x1744ad2c0>
//: called again at boot,  arg1: 555988513.977283, arg2: com.apple.Duet.APLSScheduler, arg3: -1, arg4: <AppLaunchStatsScheduler: 0x174687ee0>, arg5: timerFired:, arg6: (null), arg7: 0, returnVal: <PCPersistentTimer: 0x1744b1e20>
//: called yet again, arg1: 556027200.000000, arg2: com.apple.mobiletimer, arg3: -1, arg4: <UNSLocalNotificationClient: 0x17468da20>, arg5: _queue_triggerDidFireForTimer:, arg6: (null), arg7: 0, returnVal: <PCPersistentTimer: 0x1744bd640>
//: called after (invalidate),  arg1: 555988937.183394, arg2: com.apple.Duet.APLSScheduler, arg3: -1, arg4: <AppLaunchStatsScheduler: 0x174687ee0>, arg5: timerFired:, arg6: (null), arg7: 0, returnVal: <PCPersistentTimer: 0x1704b71c0>
-(id)_initWithAbsoluteTime:(double)arg1 serviceIdentifier:(id)arg2 guidancePriority:(unsigned long long)arg3 target:(id)arg4 selector:(SEL)arg5 userInfo:(id)arg6 triggerOnGMTChange:(BOOL)arg7 {
	id val = %orig;
	HBLogDebug(@"_initWithAbsoluteTime, arg1: %f, arg2: %@, arg3: %lld, arg4: %@, arg5: %s, arg6: %@, arg7: %d, returnVal: %@", arg1, arg2, arg3, arg4, sel_getName(arg5), arg6, arg7, val);
	return val;
}
//: called at boot.
-(void)_updateTimers {
	HBLogDebug(@"_updateTimers");
	%orig;
}
-(void)scheduleInRunLoop:(id)arg1 inMode:(id)arg2  {
	HBLogDebug(@"scheduleInRunLoop, arg1: %@, arg2: %@", arg1, arg2);
	%orig;
}
//: called after (invalidate)
-(void)_fireTimerFired {
	HBLogDebug(@"_fireTimerFired");
	%orig;
}
-(BOOL)firingIsImminent {
	BOOL val = %orig;
	HBLogDebug(@"firingIsImminent, returnVal: %d", val);
	return val;
}
//: called at boot,  returnVal: 555996535.000000
//: called again boot, returnVal: 555996535.000000
//: called again boot, returnVal: 555996535.000000
//: called again boot, returnVal: 555996535.000000
-(double)_nextForcedAlignmentAbsoluteTime {
	double val = %orig;
	HBLogDebug(@"_nextForcedAlignmentAbsoluteTime, returnVal: %f", val);
	return val;
}
//: called at boot after, (_nextForcedAlignmentAbsoluteTime),  returnVal: 556027200.000000
//: called yet again, after (_nextForcedAlignmentAbsoluteTime) returnVal: 555988513.977283
//: called yet again, after (_nextForcedAlignmentAbsoluteTime) returnVal: 556027200.000000
-(double)_earlyFireTime {
	double val = %orig;
	HBLogDebug(@"_earlyFireTime, returnVal: %f", val);
	return val;
}
-(void)cutPowerMonitorBatteryConnectedStateDidChange:(id)arg1 {
	HBLogDebug(@"cutPowerMonitorBatteryConnectedStateDidChange, arg1: %@", arg1);
	%orig;
}
-(id)initWithTimeInterval:(double)arg1 serviceIdentifier:(id)arg2 guidancePriority:(unsigned long long)arg3 target:(id)arg4 selector:(SEL)arg5 userInfo:(id)arg6 {
	id val = %orig;
	HBLogDebug(@"initWithTimeInterval1, arg1: %f, arg2: %@, arg3: %lld, arg4: %@, arg5: %s, arg6: %@, returnVal: %@", arg1, arg2, arg3, arg4, sel_getName(arg5), arg6, val);
	return val;
}
-(double)minimumEarlyFireProportion {
	double val = %orig;
	HBLogDebug(@"minimumEarlyFireProportion, returnVal: %f", val);
	return val;
}
-(BOOL)disableSystemWaking {
	BOOL val = %orig;
	HBLogDebug(@"disableSystemWaking, returnVal: %d", val);
	return val;
}
//: called at boot.
//: called after (Dealloc)
-(void)invalidate {
	HBLogDebug(@"invalidate");
	%orig;
}
//: called after (_earlyFireTime)
-(void)dealloc {
	HBLogDebug(@"dealloc");
	%orig;
}
-(NSString *)debugDescription {
	NSString *val = %orig;
	HBLogDebug(@"debugDescription, returnVal: %@", val);
	return val;
}
-(BOOL)isValid {
	BOOL val = %orig;
	HBLogDebug(@"isValid, returnVal: %d", val);
	return val;
}
-(id)userInfo {
	id val = %orig;
	HBLogDebug(@"userInfo, returnVal: %@", val);
	return val;
}
-(double)startTime {
	double val = %orig; 
	HBLogDebug(@"startTime, returnVal: %f", val);
	return val;
}
//: called at boot, arg1: 1
-(void)setDisableSystemWaking:(BOOL)arg1 {
	HBLogDebug(@"setDisableSystemWaking, arg1: %d", arg1);
	%orig;
}
-(BOOL)isUserVisible {
	BOOL val = %orig;
	HBLogDebug(@"isUserVisible, returnVal: %d", val);
	return val;
}
-(id)initWithTimeInterval:(double)arg1 serviceIdentifier:(id)arg2 target:(id)arg3 selector:(SEL)arg4 userInfo:(id)arg5  {
	id val = %orig;
	HBLogDebug(@"initWithTimeInterval2, arg1: %f, arg2: %@, arg3: %@, arg4: %s, arg5: %@, returnVal: %@", arg1, arg2, arg3, sel_getName(arg4), arg5, val);
	return val;
}
//: called at boot, arg1: 1
-(void)setUserVisible:(BOOL)arg1  {
	HBLogDebug(@"setUserVisible, arg1: %d", arg1);
	%orig;
}
//: called after (_updateTimers), arg1: <CFRunLoop 0x174166c00 [0x1b379cbb8]>{wakeup port = 0x1b03, stopped = false, ignoreWakeUps = false, 
-(void)scheduleInRunLoop:(id)arg1 {
	HBLogDebug(@"scheduleInRunLoop, arg1: %@", arg1);
	%orig;
}
//: called at boot, arg1: <OS_dispatch_queue_serial: com.apple.usernotificationsserver.NotificationSchedulingService[0x1748f0680]>
-(void)scheduleInQueue:(id)arg1 {
	HBLogDebug(@"scheduleInQueue, arg1: %@", arg1);
	%orig;
}
//: called at boot, arg1: 1.000000
//: called again at boot after (initWithFireDate), arg1: 0.000000
//:called again , arg1: 1.000000
-(void)setMinimumEarlyFireProportion:(double)arg1 {
	HBLogDebug(@"setMinimumEarlyFireProportion, arg1: %f", arg1);
	%orig;
}
//: called at boot, arg1: 2018-08-15 12:00:00 +0000, arg2: com.apple.mobiletimer, arg3: <UNSLocalNotificationClient: 0x17468da20>, arg4: _queue_triggerDidFireForTimer:, arg5: (null), returnVal: <PCPersistentTimer: 0x1744ad2c0>
//: called again at boot, arg1: 2018-08-15 01:15:13 +0000, arg2: com.apple.Duet.APLSScheduler, arg3: <AppLaunchStatsScheduler: 0x174687ee0>, arg4: timerFired:, arg5: (null), returnVal: <PCPersistentTimer: 0x1744b1e20>
//: called yet again at boot, arg1: 2018-08-15 12:00:00 +0000, arg2: com.apple.mobiletimer, arg3: <UNSLocalNotificationClient: 0x17468da20>, arg4: _queue_triggerDidFireForTimer:, arg5: (null), returnVal: <PCPersistentTimer: 0x1744bd640>
//: called after (_initWithAbsoluteTime),  arg1: 2018-08-15 01:22:17 +0000, arg2: com.apple.Duet.APLSScheduler, arg3: <AppLaunchStatsScheduler: 0x174687ee0>, arg4: timerFired:, arg5: (null), returnVal: <PCPersistentTimer: 0x1704b71c0>

-(id)initWithFireDate:(id)arg1 serviceIdentifier:(id)arg2 target:(id)arg3 selector:(SEL)arg4 userInfo:(id)arg5 {
	id val = %orig;
	HBLogDebug(@"initWithFireDate, arg1: %@, arg2: %@, arg3: %@, arg4: %s, arg5: %@, returnVal: %@", arg1, arg2, arg3, sel_getName(arg4), arg5, val);
	return val;
}
%end


@interface SBFMobileKeyBagState : NSObject
{
	NSDictionary* _state;

}
//:<SBFMobileKeyBagState: 0x17401e570; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(id)init;
-(BOOL)isEqual:(id)arg1 ;
-(unsigned long long)hash;
-(NSString *)description;
-(id)copyWithZone:(NSZone*)arg1 ;
-(id)mutableCopyWithZone:(NSZone*)arg1 ;
-(unsigned long long)failedAttemptCount;
-(BOOL)isEffectivelyLocked;
-(id)publicDescription;
-(id)initWithMKBLockStateInfo:(id)arg1 ;
-(BOOL)permanentlyBlocked;
-(double)backOffTime;
-(BOOL)shouldWipe;
-(BOOL)recoveryRequired;
-(BOOL)recoveryPossible;
-(long long)escrowCount;
-(BOOL)recoveryEnabled;
-(id)descriptionWithMultilinePrefix:(id)arg1 ;
-(id)succinctDescription;
-(id)succinctDescriptionBuilder;
-(id)descriptionBuilderWithMultilinePrefix:(id)arg1 ;
-(long long)lockState;
@end

%hook SBFMobileKeyBagState
-(id)init {
	id val = %orig;
	NSLog(@"init! called, returnVal: %@", val);
	return val;
}
//: Called at boot, returnsVal: 2 (Seems to be the value 2 throughout)
-(long long)lockState {
	long long val = %orig;
	NSLog(@"lockState, returnVal: %lld", val);
	NSDictionary *result = MSHookIvar<NSDictionary*>(self, "_state");
	NSLog(@"the result is in the dict: %@", result);
	//MSHookIvar<NSDictionary*>(self, "_state") = NULL;
	/*
	In the dictionary is 
	 boff = 0;
    countdown = 0;
    fa = 0;
    ls = 0;
    state = 20;
*/
	/*
	In the dict when the keypad view is on
	boff = 0;
    countdown = 0;
    fa = 0;
    ls = 1;
    state = 21;
	*/

	/*
	when pass is wrong, dict is:

	 boff = 59;
    countdown = 0;
    fa = 5;
    ls = 1;
    state = 269;
    */
	return val;
}
//: Called at boot, returnVal: 1 (Seems to be the val 1 throughout)
-(BOOL)isEffectivelyLocked {
	BOOL val = %orig;
	NSLog(@"isEffectivelyLocked, returnVal: %d", val);
	return val;
}
//: Called at boot, returnVal: 0
-(BOOL)permanentlyBlocked {
	BOOL val = %orig;
	NSLog(@"permanentlyBlocked, returnVal: %d", val);
	return NO;
}
//: Called at boot, returnVal: 0
-(BOOL)shouldWipe {
	BOOL val = %orig;
	NSLog(@"shouldWipe, returnVal: %d", val);
	return NO;
}
//: Called at boot, returnVal: 0
-(BOOL)recoveryRequired {
	BOOL val = %orig;
	NSLog(@"recoveryRequired, returnVal: %d", val);
	return val;
}
//: Called at boot, returnVal: 1
-(BOOL)recoveryPossible {
	BOOL val = %orig;
	NSLog(@"recoveryPossible, returnVal: %d", val);
	return val;
}
//: Called at boot, returnVal: 0.0
//: When wrong pass is entered, the first backOffTime: 59.000000
//: When wrong pass is entered twice, backOffTime:  299.000000
-(double)backOffTime {
	double val = %orig; 
	NSLog(@"backOffTime, returnVal: %f", val);
	return 0.000000;
}
//: Called at boot, returnVal: 0
//: When wrong pass is entered, the failedAttemptCount: 5
//: When wrong pass is entered twice, the failedAttemptCount: 6
-(unsigned long long)failedAttemptCount {
	unsigned long long val = %orig;
	NSLog(@"failedAttemptCount, returnVal: %lld", val);
	return 0;
}
//: Called at boot, returnVal: 0 (Seems to be 0 throughout)
-(long long)escrowCount {
	long long val = %orig;
	NSLog(@"escrowCount, returnVal: %lld", val);
	return val;
}

%end

@interface SBFMobileKeyBag : NSObject {
	//NSObject*<OS_dispatch_queue> _calloutQueue;
	//NSObject*<OS_dispatch_queue> _queue;
	//NSMutableArray* _queue_observerStateChangedCallbackBlocks;
	//NSHashTable* _queue_observers;
	BOOL _queue_hasPasscodeSet;
	BOOL _queue_hasUnlockedSinceBoot;
	int _stateChangedNotifyToken;
	int _firstUnlockNotification;

}
+(id)sharedInstance;
-(id)init;
-(void)dealloc;
//: LOOk into this
-(SBFMobileKeyBagState *)state;
-(void)addObserver:(id)arg1 ;
-(void)removeObserver:(id)arg1 ;
-(void)_queue_handleKeybagStatusChanged;
-(void)_queue_firstUnlockOccurred;
-(id)_queue_lockStateExtended:(BOOL)arg1 ;
-(void)_queue_setHasPasscodeIfNecessary:(id)arg1 ;
-(void)_queue_createStashBag:(id)arg1 ;
-(void)createStashBag:(id)arg1 completion:(/*^block*/id)arg2 completionQueue:(id)arg3 ;
-(BOOL)_queue_verifyExpectedStashState:(long long)arg1 ;
-(void)lockSkippingGracePeriod:(BOOL)arg1 ;
-(BOOL)unlockWithPasscode:(id)arg1 error:(id*)arg2 ;
//-(BOOL)hasPasscodeSet;
-(void)createStashBag:(id)arg1 completion:(/*^block*/id)arg2 ;
-(BOOL)hasBeenUnlockedSinceBoot;
-(SBFMobileKeyBagState *)extendedState;
-(BOOL)beginRecovery:(id)arg1 error:(id*)arg2 ;
-(void)waitForUnlockWithTimeout:(float)arg1 ;
@end

%hook SBFMobileKeyBag
//: !!! investigate SBFMobileKeyBagState

//: @ boot: returnVal: <SBFMobileKeyBag: 0x17046b400>
//: @2 boot: returnVal: <SBFMobileKeyBag: 0x170479c00>
+(id)sharedInstance {
	id val = %orig;
	NSLog(@"sharedInstance, returnVal: %@", val);
	return val;
}
//: @ boot: returnVal: <SBFMobileKeyBag: 0x17046b400>
//: @2 boot: <SBFMobileKeyBag: 0x170479c00>
-(id)init {
	id val = %orig;
	NSLog(@"init, returnVal: %@", val);
	return val;

}
-(void)dealloc {
	NSLog(@"dealloc called!");

}
//: LOOk into this
-(SBFMobileKeyBagState *)state {
	SBFMobileKeyBagState *val = %orig;
	NSLog(@"SBFstate, returnVal: %@", val);
	return val;
}

//: Gets called at boot 
//: <SBFUserAuthenticationController: 0x1702f9180; authState: Revoked; passcodeSet: YES>
//: <SBFUserAuthenticationController: 0x1702f9180; authState: Revoked; passcodeSet: YES>
//: <SBUIBiometricResource: 0x1744c6890> isFingerOn = NO;
//: not called when user types incorrect password.
-(void)addObserver:(id)arg1 {
	NSLog(@"addObserver, arg1: %@", arg1);
	%orig;
}
-(void)removeObserver:(id)arg1 {
	NSLog(@"removeObserver, arg1: %@", arg1);
	%orig;
}
//: called when pass was correct
-(void)_queue_handleKeybagStatusChanged {
	NSLog(@"_queue_handleKeybagStatusChanged");
	%orig;
}
-(void)_queue_firstUnlockOccurred{
	NSLog(@"_queue_firstUnlockOccurred");
	%orig;
}
//: called at boot, arg1: 1, returnVal: <SBFMobileKeyBagState: 0x17401e570; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
//: called at boot, arg1: 0, returnVal: <SBFMobileKeyBagState: 0x17401c5b0; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
//: called at boot, arg1: 1, returnVal: <SBFMobileKeyBagState: 0x17420d140; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
//:!! called @ 3rd incorrect pass, arg1: 0, returnVal: <SBFMobileKeyBagState: 0x1702103e0; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 59; failedAttemptCount: 5; escrowCount: 0>
//: called after phone locks,  arg1: 1, returnVal: <SBFMobileKeyBagState: 0x170218440; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 38; failedAttemptCount: 5; escrowCount: 0>
//:!! when pass is correct: arg1: 1, returnVal: <SBFMobileKeyBagState: 0x170205190; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(id)_queue_lockStateExtended:(BOOL)arg1  {
	id val = %orig;
	NSLog(@"_queue_lockStateExtended, arg1: %d, returnVal: %@", arg1, val);
	return val;
}
//: called at boot, arg1: <SBFMobileKeyBagState: 0x17401e570; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
//: called when pass is correcT: arg1: <SBFMobileKeyBagState: 0x170205190; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(void)_queue_setHasPasscodeIfNecessary:(id)arg1 {
	NSLog(@"_queue_setHasPasscodeIfNecessary, arg1: %@", arg1);
	%orig;
}
-(void)_queue_createStashBag:(id)arg1 {
	NSLog(@"_queue_createStashBag, arg1: %@", arg1);
	%orig;
}
-(void)createStashBag:(id)arg1 completion:(/*^block*/id)arg2 completionQueue:(id)arg3 {
	NSLog(@"createStashBag, arg1: %@, arg2: %@, arg3: %@", arg1, arg2, arg3);
	%orig;
}
-(BOOL)_queue_verifyExpectedStashState:(long long)arg1 {
	BOOL val = %orig;
	NSLog(@"_queue_verifyExpectedStashState, arg1: %lld, returnVal: %d", arg1, val);
	return val;

}
-(void)lockSkippingGracePeriod:(BOOL)arg1 {
	NSLog(@"lockSkippingGracePeriod, arg1: %d", arg1);
	%orig;
}
-(BOOL)unlockWithPasscode:(id)arg1 error:(id*)arg2 {
	BOOL val = %orig;
	NSLog(@"unlockWithPasscode, arg1: %@, arg2: %@, returnVal: %d", arg1, *arg2, val);
	return val;
}
-(void)createStashBag:(id)arg1 completion:(/*^block*/id)arg2 {
	NSLog(@"createStashBag, arg1: %@, arg2: %@", arg1, arg2);
}
//: At boot, return val is YES;
-(BOOL)hasBeenUnlockedSinceBoot {
	BOOL val = %orig;
	NSLog(@"KEYhasBeenUnlockedSinceBoot, %d", val);
	return val;
}
//: CALLED at boot many times, returnVal: <SBFMobileKeyBagState: 0x17001f4b0; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
//: called after 3rd wrong attempt, returnVal: <SBFMobileKeyBagState: 0x17420cc20; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 59; failedAttemptCount: 5; escrowCount: 0>
//: CALLED after correct attempt,  returnVal: <SBFMobileKeyBagState: 0x1702053b0; lockState: Locked; isEffectivelyLocked: YES; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(SBFMobileKeyBagState *)extendedState {
	SBFMobileKeyBagState *val = %orig;
	NSLog(@"extendedState, returnVal: %@", val);
	return val;
}
-(BOOL)beginRecovery:(id)arg1 error:(id*)arg2 {
	BOOL val = %orig;
	NSLog(@"beginRecovery, %d", val);
	return val;
}
-(void)waitForUnlockWithTimeout:(float)arg1 {
	NSLog(@"waitForUnlockWithTimeout, %f", arg1);
	%orig;
}

%end


@interface SBFUserAuthenticationController : NSObject {
	SBFMobileKeyBag* _keybag;
	//NSMutableArray* _responders;
	//NSHashTable* _observers;
	//: Might look into this further 
	//id<SBFUserAuthenticationModel> _model;
	//long long _authenticationState;
	NSDate* _lastRevokedAuthenticationDate;
	//SBFAuthenticationAssertionManager* _assertionManager;
	//id<SBFAuthenticationPolicy> _policy;
	NSString* _lastIncorrectPasscodeAttempt;
	//SBFAuthenticationAssertion* _transientAuthCheckingAssertion;
	//CFRunLoopObserverRef _runLoopObserver;
	PCPersistentTimer* _unblockTimer;
	long long _cachedAuthFlag;
	BOOL _inSecureMode;
}
+(BOOL)_isInBioUnlockState;
-(NSString *)description;
-(id)publicDescription;
-(void)keybag:(id)arg1 extendedStateDidChange:(id)arg2 ;
-(BOOL)hasPasscodeSet;
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2 keybag:(id)arg3 model:(id)arg4 ;
-(void)_initializeAuthenticationStateAndDateForLockState:(long long)arg1 ;
-(void)_establishAuthenticationStateForInit:(long long)arg1 ;
-(void)_setupPolicy:(id)arg1 ;
-(void)_setHasBeenAuthenticatedOnceSinceBoot:(BOOL)arg1 ;
-(void)_clearUnblockTimer;
-(BOOL)_processAuthenticationRequest:(id)arg1 responder:(id)arg2 ;
-(long long)_evaluateAuthenticationAttempt:(id)arg1 outError:(id*)arg2 ;
-(void)_notifyClientsOfAuthenticationResult:(long long)arg1 forRequest:(id)arg2 error:(id)arg3 withResponder:(id)arg4 ;
-(BOOL)_boolForAuthenticationResult:(long long)arg1 ;
-(void)_handleSuccessfulAuthentication:(id)arg1 responder:(id)arg2 ;
-(void)_handleFailedAuthentication:(id)arg1 error:(id)arg2 responder:(id)arg3 ;
-(void)_handleInvalidAuthentication:(id)arg1 responder:(id)arg2 ;
-(void)_scheduleUnblockTimer;
-(void)_setAuthState:(long long)arg1 ;
-(void)_updateAuthenticationStateImmediately:(BOOL)arg1 forPublicReason:(id)arg2 ;
-(BOOL)_performNilPasscodeCheck;
-(void)_setSecureMode:(BOOL)arg1 postNotification:(BOOL)arg2 ;
-(BOOL)_isUserAuthenticated;
-(void)_revokeAuthenticationImmediately:(BOOL)arg1 forPublicReason:(id)arg2 ;
-(void)_updateAuthenticationStateForPublicReason:(id)arg1 ;
//-(BOOL)isAssertionValid:(id)arg1 ; GIVES PHONE ENDLESS LOOP and crashes
-(void)notePasscodeEntryBegan;
-(void)notePasscodeEntryCancelled;
-(void)_notifyAboutTemporaryBlockStatusChanged;
-(BOOL)_isTemporarilyBlocked;
-(BOOL)_isPermanentlyBlocked;
-(void)_refreshModelCacheIfNeeded;
-(long long)_evaluatePasscodeAttempt:(id)arg1 outError:(id*)arg2 ;
-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2 ;
-(void)_setup_runLoopObserverIfNecessary;
-(void)_invalidateCachedPasscodeLockState;
-(void)_updateSecureModeIfNecessaryForNewAuthState;
-(void)_setOkToSendNotifications:(BOOL)arg1 ;
-(void)_updateHasPasscodeSetForLockState:(long long)arg1 ;
-(BOOL)_shouldRevokeAuthenticationNow;
-(void)_unblockTimerFired;
-(void)_updateAuthenticationStateAndDateForLockState:(id)arg1 ;
-(void)deviceLockModelRequestsDeviceWipe:(id)arg1 ;
-(void)deviceLockStateMayHaveChangedForModel:(id)arg1 ;
-(BOOL)hasAuthenticatedAtLeastOnceSinceBoot;
-(BOOL)isAuthenticatedCached;
-(void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)arg1 ;
-(void)revokeAuthenticationIfNecessaryForPublicReason:(id)arg1 ;
-(void)processAuthenticationRequest:(id)arg1 responder:(id)arg2 ;
-(void)processAuthenticationRequest:(id)arg1 ;
-(void)addAuthenticationAssertion:(id)arg1 ;
-(void)removeAuthenticationAssertion:(id)arg1 ;
//-(double)_timeUntilUnblockedSinceReferenceDate;
-(void)_addPrivateAuthenticationObserver:(id)arg1 ;
-(NSDate *)lastRevokedAuthenticationDate;
-(void)setHasPasscodeSet:(BOOL)arg1 ;
-(void)_setPolicy:(id)arg1 ;
-(id)_responders;
//-(id)_unblockTimer;
//-(void)_setUnblockTimer:(id)arg1 ;
-(BOOL)isAuthenticated;
-(void)_setModel:(id)arg1 ;
-(id)descriptionWithMultilinePrefix:(id)arg1 ;
-(id)succinctDescriptionBuilder;
-(id)descriptionBuilderWithMultilinePrefix:(id)arg1 ;
-(id)_model;
@end

@interface SBFUserAuthenticationModelSEP : NSObject {
	double _unblockTime;

} 
//-(void)refreshBlockedState;
-(BOOL)isTemporarilyBlocked;
-(double)timeUntilUnblockedSinceReferenceDate;
-(BOOL)isPermanentlyBlocked;
//-(void)clearBlockedState;
//-(NSString *)description;
-(void)notePasscodeUnlockFailedWithError:(id)arg1 ;
@end


%hook SBFUserAuthenticationModelSEP
-(BOOL)isTemporarilyBlocked{
	return NO;
}
//: VALUE BEFORE didfinish gets called
//: Printed: -63114076800.000000
//: printed: -63114076800.000000
//: when user gets 4th attempt wrong, 
// 555890190.482543 is next new val
// 555890190.815751 is the new val

-(double)timeUntilUnblockedSinceReferenceDate{
	MSHookIvar<double>(self, "_unblockTime") = 0.0;

	double val = %orig;
	NSLog(@"timeUntilUnblockedSinceReferenceDate: %f \n", val);

	return 0.0;

}
-(BOOL)isPermanentlyBlocked {
	return NO;
}

//: 6
-(void)notePasscodeUnlockFailedWithError:(id)arg1 {
	//: MOVED from timeUntilUnblockedSinceReferenceDate to here.
	double time = MSHookIvar<double>(self, "_unblockTime");
	NSLog(@"_unblockTime, %f \n", time);
	MSHookIvar<double>(self, "_unblockTime") = 0.0;

	NSLog(@"notePasscodeUnlockFailedWithError, %@ \n", arg1);
	//NSLog(@"arg2 belongs to %@", [arg1 class]);

	//: arg2 = Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
	//: arg22 belongs to NSError 
	%orig;
}
%end



%hook SBFUserAuthenticationController
static BOOL hasBeenCalledBefore = NO;
static id defaultVal; 
//: Called user uses finger as passcode
+(BOOL)_isInBioUnlockState{
	BOOL val = %orig;
	NSLog(@"_isInBioUnlockState %d", val);
	return val;
}

//: Start up val returns: < SBFUserAuthenticationController: 0x1744e1580; authState: Revoked; passcodeSet: YES>
-(NSString *)description {
	NSString *val = %orig;
	NSLog(@"description %@", val);
	return val;
}

//: Start up val: <SBFUserAuthenticationController: 0x1742f5000; authState: Revoked; hasPasscodeSet: YES; revokedAuthDate: 2018-08-13 11:39:57 -0400; model: ...
//: Prints out SBFUserAuthenticationController: 0x1744e1580; authState: Revoked; hasPasscodeSet: YES; revokedAuthDate: 2018-08-12 16:59:23 -0400
//: This keeps track of our last successful password date and time.
-(id)publicDescription {
	id val = %orig;
	NSLog(@"publicDescription, return val: %@", val);
	return val;
}
//: CALLED AFTER 16 CORRECT ATTEMPT, arg1: <SBFMobileKeyBag: 0x17446eac0> (arg2) value: <SBFMobileKeyBagState: 0x170204ab0; lockState: Unlocked; isEffectivelyLocked: NO; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(void)keybag:(id)arg1 extendedStateDidChange:(id)arg2 {
	id val = arg1;
	id val2 = arg2;
	NSLog(@"keybag called, arg1: %@ (arg2) value: %@", val, val2);
	%orig;
}
//: Tells us whether there is a passcode set 
-(BOOL)hasPasscodeSet {
	BOOL val = %orig;
	NSLog(@"hasPasscodeSet %d", val);
	return val;
}
//: start up for arg1 returns :  <SBFAuthenticationAssertionManager: 0x17422bd00> 
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2 keybag:(id)arg3 model:(id)arg4 {
	id val = arg1; 
	id val2 = arg2; 
	id val3 = arg3; 
	id val4 = arg4; 
	id finalValue = %orig;
	NSLog(@"initWithAssertionManager, arg values: %@ %@ %@ %@ return val: %@", val, val2, val3, val4, finalValue);
	return %orig;
}
//: The starting value is 2
-(void)_initializeAuthenticationStateAndDateForLockState:(long long)arg1 {
	long long val = arg1;
	NSLog(@"_initializeAuthenticationStateAndDateForLockState %lld", val); 
	%orig;
}

//: Starting value of arg1 is 2
-(void)_establishAuthenticationStateForInit:(long long)arg1 {
	long long val = arg1;
	NSLog(@"_establishAuthenticationStateForInit, arg1: %lld", val);
	//%log;
	%orig;
}
//: arg1 is of type SBDefaultAuthenticationPolicy
-(void)_setupPolicy:(id)arg1 {
	id val = arg1;
	NSLog(@"_setupPolicy arg1: %@", val);
	%orig;
}
//: Start up val for arg1 is YES
-(void)_setHasBeenAuthenticatedOnceSinceBoot:(BOOL)arg1 {
	BOOL val = arg1;
	NSLog(@"_setHasBeenAuthenticatedOnceSinceBoot, arg1: %d", val);
	%orig;
}
//: THis is called at startup
-(void)_clearUnblockTimer {
	NSLog(@"_clearUnblockTimer");
	//%log;
	%orig;
}

//: This is called after (_boolForAuthenticationResult), arg1: <SBFAuthenticationRequest: 0x17105fb00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171275340>>, arg2: (null)
//: UPDATE: 2ND FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1710427f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171679f40>>, arg2: (null)
//: UPDATE: 3RD FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x17444d470; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174a61680>> arg2: (null)
//: UPDATE: 4TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x170845130; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17067be40>> arg2: (null)
//: UPDATE: 5TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x170842fa0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>> arg2: (null)
//: UPDATE: 6TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x174e5ce00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17527f540>> arg2: (null)
//: UPDATE: 7TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175656830; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175666a80>> arg2: (null)
//: UPDATE: 8TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1754597d0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17446e000>> arg2: (null)
//: UPDATE: 9TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x171451f40; type: 1; source: 0; handler: <__NSMallocBlock__: 0x170a7e500>> arg2: (null)
//: UPDATE 10TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x17144cff0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171278640>> arg2: (null)
//: UPDATE 13TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175443150; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175478b80>> arg2: (null)
//: UPDATE 14TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1750544f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17546e040>> arg2 (null)
//: UPDATE 17 CORRECT ATTEMPT:  arg1: <SBFAuthenticationRequest: 0x174447140; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174869b40>>, arg2 (null)
-(BOOL)_processAuthenticationRequest:(id)arg1 responder:(id)arg2 {
	BOOL val = %orig;
	NSLog(@"_processAuthenticationRequest, arg1: %@, responder %@", arg1, arg2);
	//%log;
	return val;
}
//: 3

//: Called after (_evaluatePasscodeAttempt), arg1: <SBFAuthenticationRequest: 0x17105fb00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171275340>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", return val: 1;
//: UPDATE: 2ND pass attempt, arg1:  <SBFAuthenticationRequest: 0x1710427f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171679f40>>, arg2: (null)
//: UPDATE: 3rd pass attempt, arg1: <SBFAuthenticationRequest: 0x17444d470; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174a61680>> arg2: (null)
//: UPDATE: 4TH pass attempt, arg1: <SBFAuthenticationRequest: 0x170845130; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17067be40>> arg2: (null)
//: UPDATE: 5TH pass attempt, arg1: <SBFAuthenticationRequest: 0x170842fa0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>> arg2: (null)
//: UDPATE 6TH pass attempt,  arg1: <SBFAuthenticationRequest: 0x174e5ce00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17527f540>> arg2: (null)
//: UPDATE 7TH pass attempt,  arg1: <SBFAuthenticationRequest: 0x175656830; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175666a80>> arg2: (null)
//: UPDATE 8TH pass attempt, arg1: <SBFAuthenticationRequest: 0x1754597d0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17446e000>> arg2: (null)
//: UPDATE 9TH pass attempt, arg1: <SBFAuthenticationRequest: 0x171451f40; type: 1; source: 0; handler: <__NSMallocBlock__: 0x170a7e500>> arg2: (null)
//: UPDATE 10TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x17144cff0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171278640>> arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
//: UPDATE 11TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1754541c0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175665700>> arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
//: UPDATE 12TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x171856530; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>> arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
//:!! UPDATE 13TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175443150; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175478b80>> arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)"
//:!! UPDATE 14TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1750544f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17546e040>> arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)"
//:!! UPDATE 15TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x171854a00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17147ecc0>> arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)"
//:??? CORRECT 16 PASS: arg1: <SBFAuthenticationRequest: 0x174447140; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174869b40>> arg2: (null)
//:??? CORRECT 17 PASS:  arg1: <SBFAuthenticationRequest: 0x175a43f30; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17427c8c0>> arg2: (null)
-(long long)_evaluateAuthenticationAttempt:(id)arg1 outError:(id*)arg2 {
	//%log;
	long long val = %orig;
	NSLog(@"_evaluateAuthenticationAttempt, arg1: %@ arg2: %@, returnVAL: %lld", arg1, *arg2, val);
	//NSLog(@"arg2 is %@", *arg2);
	//NSLog(@"arg2 belongs to %@", [*arg2 class]);
	//: arg2 = Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
	//: arg2 belongs to NSError
	return val;
}

//: 4

//: Called after (_evaluateAuthenticationAttempt), arg1: <SBFAuthenticationRequest: 0x17105fb00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171275340>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
//: UPDATE 2ND PASS ATTEMPT: arg1: 3, arg2:  <SBFAuthenticationRequest: 0x1710427f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171679f40>>, arg3: (null), arg4: (nill)
//: UPDATE 3RD PASS ATTEMPT: arg1: 3, arg2: <SBFAuthenticationRequest: 0x17444d470; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174a61680>>, arg3: (null), arg4: (null)
//: UPDATE 4TH PASS ATTEMPT: arg1: 3, arg2: <SBFAuthenticationRequest: 0x170845130; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17067be40>>, arg3: (null), arg4: (null)
//: UPDATE 5TH PASS ATTEMPT: arg1: 3, arg2: <SBFAuthenticationRequest: 0x170842fa0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>>, arg3: (null), arg4: (null)
//: UPDATE 6TH PASS ATTEMPT, arg1: 3, arg2: <SBFAuthenticationRequest: 0x174e5ce00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17527f540>>, arg3: (null), arg4: (null)
//: UPDATE 7TH PASS ATTEMPT, arg1: 3, arg2: <SBFAuthenticationRequest: 0x175656830; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175666a80>>, arg3: (null), arg4: (null)
//: UPDATE 8TH PASS ATTEMPT, arg1: 3, arg2: <SBFAuthenticationRequest: 0x1754597d0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17446e000>>, arg3: (null), arg4: (null)
//: UPDATE 9TH PASS ATTEMPT, arg1: 3, arg2: <SBFAuthenticationRequest: 0x171451f40; type: 1; source: 0; handler: <__NSMallocBlock__: 0x170a7e500>>, arg3: (null), arg4: (null)
//: UPDATE 10TH PASS ATTEMPT, arg1: 1, arg2: <SBFAuthenticationRequest: 0x17144cff0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171278640>>, arg3: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", arg4: (null)
//: UPDATE 11TH PASS ATTEMPT, arg1: 1, arg2: <SBFAuthenticationRequest: 0x1754541c0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175665700>>, arg3: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", arg4: (null)
//: UPDATE 12TH PASS ATTEMPT, arg1: 1, arg2: <SBFAuthenticationRequest: 0x171856530; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>>, arg3: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", arg4: (null)
//: UPDATE 13TH PASS ATTEMPT, arg1: 1, arg2: <SBFAuthenticationRequest: 0x175443150; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175478b80>>, arg3: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", arg4: (null)
//: UPDATE 14TH PASS ATTEMPT, arg1: 1, arg2: <SBFAuthenticationRequest: 0x1750544f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17546e040>>, arg3: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", arg4: (null)
//: UPDATE 15TH PASS ATTEMPT, arg1: 1, arg2: <SBFAuthenticationRequest: 0x171854a00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17147ecc0>>, arg3: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", arg4: (null)
//: ?? CORRECT 16TH PASS ATTEMPT, arg1: 2, arg2: <SBFAuthenticationRequest: 0x174447140; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174869b40>>, arg3: (null), arg4: (null)
//: ?? CORRECT 17TH PASS ATTEMPT,  arg1: 2, arg2: <SBFAuthenticationRequest: 0x175a43f30; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17427c8c0>>, arg3: (null), responder: (null)

-(void)_notifyClientsOfAuthenticationResult:(long long)arg1 forRequest:(id)arg2 error:(id)arg3 withResponder:(id)arg4 {
	NSLog(@"_notifyClientsOfAuthenticationResult, arg1: %lld, arg2: %@, arg3: %@, responder: %@", arg1, arg2, arg3, arg4);
	//NSLog(@"arg3 is %@", arg3);
	//NSLog(@"arg3 belongs to %@", [arg3 class]);
	//%log;
	//: arg3 = Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
	//: arg3 belongs to NSError
	%orig;
}
// arg1 a 1 if failed passcode attempt is 2 if success
//Dont change this
//: After entering wrong pass, arg1 is 1, and the return val is NO;
//: UPDATE: 2nd failed attempt, arg1 is 3, return val is NO;
//: UPDATE 3RD FAILED ATTEMPT, arg1: 3, return val NO;
//: UPDATE 4TH FAILED ATTEMPT, arg1: 3, return val: NO;
//: UPDATE 5TH FAILED ATTEMPT, arg1: 3, return val: NO;
//: UPDATE 6TH FAILED ATTEMPT, arg1: 3, return val: NO; 
//: UPDATE 7TH FAILED ATTEMPT, arg1: 3, return val: NO; 
//: UPDATE 8TH FAILED ATTEMPT, arg1: 3, return val: NO; 
//: UPDATE 9TH FAILED ATTEMPT, arg1: 3, return val: NO; 
//: UPDATE 10TH FAILED ATTEMPT, arg1: 1, return val: NO; (CALLED AFTER (_clearUnblockTimer))
//: UPDATE 11TH FAILED ATTEMPT, arg1: 1, return val: NO; (CALLED AFTER (_clearUnblockTimer))
//: UPDATE 12TH FAILED ATTEMPT, arg1: 1, return val: NO; (CALLED AFTER (_clearUnblockTimer))
//: UPDATE 13TH FAILED ATTEMPT, arg1: 1, return val: NO; (CALLED AFTER (_clearUnblockTimer))
//: ??? AFTER 16 CORRECT ATTEMPT, arg1: 2, return val: YES
//: ??? AFTER 17 CORRECT ATTEMPT, arg1: 2, return val: YES
-(BOOL)_boolForAuthenticationResult:(long long)arg1 {
	BOOL val = %orig;
	NSLog(@"_boolForAuthenticationResult arg1: %lld, return val: %d", arg1, val);
	//%log;
	return val;
}
//: called when pass is correct
//: CALLED ON THE 16 CORRECT ATTEMPT, arg1: <SBFAuthenticationRequest: 0x174447140; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174869b40>>, responder: (null)
//: CALLED ON THE 17 CORRECT ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175a43f30; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17427c8c0>>, responder: (null)
-(void)_handleSuccessfulAuthentication:(id)arg1 responder:(id)arg2  {
	NSLog(@"_handleSuccessfulAuthentication, arg1: %@, responder: %@", arg1, arg2);
	//%log;
	%orig;
}

//: 5

//: Called after (_notifyClientsOfAuthenticationResult)!!!, arg1: 1, arg2: <SBFAuthenticationRequest: 0x17105fb00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171275340>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", arg3: (null)
//: called after 10th attempt, arg1: <SBFAuthenticationRequest: 0x17144cff0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171278640>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", arg3: (null)
//: !!!!!NOTE AFTER THE 1OTH ATTEMPT,( _scheduleUnblockTimer) THEN (_clearUnblockTimer) WAS CALLED!
//: UPDATE: 11TH ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1754541c0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175665700>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", arg3: (null)
//: CALLED AFTER 12TH ATTEMPT, arg1: <SBFAuthenticationRequest: 0x171856530; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", arg3: (null)
//: CALLED AFTER 13TH ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175443150; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175478b80>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", arg3: (null)
//: CALLED AFTER 14TH ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1750544f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17546e040>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", arg3: (null)
//: CALLED AFTER 15TH ATTEMPT, arg1: <SBFAuthenticationRequest: 0x171854a00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17147ecc0>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", arg3: (null)
-(void)_handleFailedAuthentication:(id)arg1 error:(id)arg2 responder:(id)arg3 {
	NSLog(@"_handleFailedAuthentication, arg1: %@, arg2: %@, responder: %@", arg1, arg2, arg3);
	//NSLog(@"arg2 is %@", arg2);
	//NSLog(@"arg2 belongs to %@", [arg2 class]);
	//%log;

	//: arg2 = Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
	//: arg2 belongs to NSError
	%orig;
}
//: CAlled after 2nd failed attempt, arg1: <SBFAuthenticationRequest: 0x1710427f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171679f40>>, arg2: (null)
//: CALLED AFTER 3RD FAILED attempt, arg1: <SBFAuthenticationRequest: 0x17444d470; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174a61680>>, arg2: (null)
//: CALLED AFTER 4TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x170845130; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17067be40>>, arg2: (null)
//: CALLED AFTER 5TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x170842fa0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>>, arg2: (null)
//: CALLED AFTER 6TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x174e5ce00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17527f540>>, arg2: (null)
//: CALLED AFTER 7TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175656830; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175666a80>>, arg2: (null)
//: CALLED AFTER 8TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1754597d0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17446e000>>, arg2: (null)
//: CALLED AFTER 8TH FAILED ATTEMPT, arg1: <SBFAuthenticationRequest: 0x171451f40; type: 1; source: 0; handler: <__NSMallocBlock__: 0x170a7e500>>, arg2: (null)
-(void)_handleInvalidAuthentication:(id)arg1 responder:(id)arg2 {
	NSLog(@"_handleInvalidAuthentication, arg1: %@, responder: %@", arg1, arg2);
	//%log;
	%orig;
}
//: This is called at startup
//: This triggers the timer 
//: The order for startup is : (_scheduleUnblockTimer) then (_clearUnblockTimer) and finally (_refreshModelCacheIfNeeded)
//: UPDATE: this is called after (_handleFailedAuthentication)
-(void)_scheduleUnblockTimer {
	NSLog(@"_scheduleUnblockTimer");
	//%log;
	//%orig;
	//[self _unblockTimerFired];
	%orig;
}
//: AFTER THE 16 CORRECT PASS, ARG1: 1
//: AFTER THE 17 CORRECT PASS, ARG1: 1
-(void)_setAuthState:(long long)arg1  {
	NSLog(@"_setAuthState, arg1 %lld", arg1);
	//%log;
	%orig;
}
//: At startup arg1: YES & arg2: StartupTransitionToLockOut
//: After (_updateAuthenticationStateForPublicReason) called, arg1: NO & arg2: remove authentication assertion: <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
//: After (revokeAuthenticationIfNecessaryForPublicReason) called, arg1: NO, arg 2: Lock button

//: UPDATE, after (revokeAuthenticationIfNecessaryForPublicReason) gets called because of lock screen going away, this func gets called.
//: GETS CALLED AFTER 17 CORRECT PASS: arg1 0, reason: authentication successful from authentication request
-(void)_updateAuthenticationStateImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	NSLog(@"_updateAuthenticationStateImmediately, arg1 %d, reason: %@", arg1, arg2);
	%orig;
}

//: Called when user uses finger as passcode
-(BOOL)_performNilPasscodeCheck{
	BOOL val = %orig;
	NSLog(@"_performNilPasscodeCheck return val: %d", val);
	return val;
}

//: arg1 is 1 and arg2 is 0 at startup
//: arg1 is 1 or YES when locked and 0 OR NO when unlocked
//: AFTER CORRECT 16 PASS, ARG1: NO and and arg2 is YES
-(void)_setSecureMode:(BOOL)arg1 postNotification:(BOOL)arg2 {
	NSLog(@"_setSecureMode, arg1: %d, notification: %d", arg1, arg2);
	//%log;
	%orig;
}

//: At startup this returns a NO.
//: ON THE CORRECT 16 PASS, THIS RETURNS A YES
-(BOOL)_isUserAuthenticated{
	BOOL val = %orig;
	NSLog(@"_isUserAuthenticated %d", val);
	return val;
}
//arg1: 0, reason remove authentication assertion: <SBFAuthenticationAssertion: 0x170e45b80; reason: UI unlocked; type: SustainAuthentication; valid: NO>
-(void)_revokeAuthenticationImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	BOOL val = arg1;
	NSLog(@"_revokeAuthenticationImmediately, arg1: %d, reason %@", val, arg2);
	%orig;
}

//: Called after removeAuthenticationAssertion(), arg1 is remove authentication assertion: <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
-(void)_updateAuthenticationStateForPublicReason:(id)arg1 {
	NSLog(@"_updateAuthenticationStateForPublicReason, arg1: %@", arg1);
	//%log;
	 %orig;
}

//: Gets called whenever user taps a number
-(void)notePasscodeEntryBegan {
	//NSLog(@"notePasscodeEntryBegan");
	//%log;
	 %orig;
}
//: Gets called when user deletes all numbers tapped
-(void)notePasscodeEntryCancelled {
	//NSLog(@"notePasscodeEntryCancelled");
	//%log;
	 %orig;
}
//: CALLED RIGHT AFTER (deviceLockStateMayHaveChangedForModel) which was called due to incorrect pass
//: UPDATE 14: CALLED AFTER (_unblockTimerFired)
//: UPDATE 15: CALLED AFTER (deviceLockStateMayHaveChangedForModel)
//: UPDATE 16: CALLED AFTER (deviceLockStateMayHaveChangedForModel)
//: CALLED AFTER SUCCESS TO0!
//: UPDATE: 17: CALLED AFTER SUCCES ENTRY.
-(void)_notifyAboutTemporaryBlockStatusChanged {
	NSLog(@"_notifyAboutTemporaryBlockStatusChanged");
	//%log;
	 %orig;
}
//: The startup return val is NO.
//: AFTER 13TH ATTEMPT WRONG:  return val YES! (This is called after (_refreshModelCacheIfNeeded))
-(BOOL)_isTemporarilyBlocked {
	BOOL val = %orig;
	NSLog(@"_isTemporarilyBlocked, return val %d", val);
	return NO;
}
//: The startup return val is NO.
//: AFTER 13 ATTEMPT: return val YES! (This is called after (_refreshModelCacheIfNeeded))
-(BOOL)_isPermanentlyBlocked {
	 BOOL val = %orig;
	NSLog(@"_isPermanentlyBlocked, return val %d", val);
	return NO;
}
//: This is called at startup
-(void)_refreshModelCacheIfNeeded{
	NSLog(@"_refreshModelCacheIfNeeded");
	//%log;
	%orig;
}

//: 2

//: Called after (_authenticateWithPasscodeData), arg1: <SBFAuthenticationRequest: 0x17105fb00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171275340>>, arg2: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null), return val: 1;
//: UPDATE: 2ND attempt to pass, arg1: <SBFAuthenticationRequest: 0x1710427f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171679f40>>, arg2: (null), return Val: 3;
//: UPDATE: 3rd pass attempt, arg1: <SBFAuthenticationRequest: 0x17444d470; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174a61680>>, arg2: (null), return val: 3
//: UPDATE: 4TH pass attempt, arg1: <SBFAuthenticationRequest: 0x170845130; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17067be40>>, arg3: (null), returnVal: val: 3
//: UPDATE: 5TH pass attempt, arg1: <SBFAuthenticationRequest: 0x170842fa0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>>, error: (null), returnVal: val: 3
//: UPDATE: 6TH pass attempt, arg1: <SBFAuthenticationRequest: 0x174e5ce00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17527f540>>, error: (null), returnVal: val: 3
//: UPDATE: 7TH pass attempt, arg1: <SBFAuthenticationRequest: 0x175656830; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175666a80>>, error: (null), returnVal: val: 3
//: UPDATE: 8TH pass attempt, arg1: <SBFAuthenticationRequest: 0x1754597d0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17446e000>>, error: (null), returnVal: val: 3
//: UPDATE: 9TH pass attempt, arg1: <SBFAuthenticationRequest: 0x171451f40; type: 1; source: 0; handler: <__NSMallocBlock__: 0x170a7e500>>, error: (null), returnVal: val: 3
//: UPDATE: 10TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x17144cff0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x171278640>>, error: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", returnVal: val: 1 (TYPED A DIFF PASS)
//: UPDATE: 11TH PASSS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1754541c0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175665700>>, error: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", returnVal: val: 1
//: UPDATE: 12TH PASS ATTTEMPT, arg1: <SBFAuthenticationRequest: 0x171856530; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17087c200>>, error: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", returnVal: val: 1
//: UPDATE 13TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175443150; type: 1; source: 0; handler: <__NSMallocBlock__: 0x175478b80>>, error: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", returnVal: val: 1
//: UPDATE 14TH PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x1750544f0; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17546e040>>, error: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", returnVal: val: 1
//: UPDATE 15 PASS ATTEMPT, arg1: <SBFAuthenticationRequest: 0x171854a00; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17147ecc0>>, error: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", returnVal: val: 1
//: ??? 16 CORRECT PASS: arg1: <SBFAuthenticationRequest: 0x174447140; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174869b40>>, error: (null), returnVal: val: 2
//: ??? 17 CORRECT PASS: arg1: <SBFAuthenticationRequest: 0x175a43f30; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17427c8c0>>, error: (null), returnVal: val: 2
-(long long)_evaluatePasscodeAttempt:(id)arg1 outError:(id*)arg2 {
	long long val = %orig;
	NSLog(@"_evaluatePasscodeAttempt, arg1: %@, error: %@, returnVal: val: %lld", arg1, *arg2, val);
	//NSLog(@"arg2 is %@", *arg2);
	//NSLog(@"arg2 belongs to %@", [*arg2 class]);
	//: arg2 = Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
	//: arg2 belongs to NSError
	//%log;
	return val;
}

//: 1

//: IMPORTANT
//: Called when password is entered
//: When pass is wrong, arg1: <30303030> arg2:  Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", return val: NO
//: 10 ATTEMPT wrong: arg1: <39363433>, outError: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", returnVal: 0
//: 11 ATTEMPT WRONG: arg1: <34333433>, outError: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", returnVal: 0
//: 12 ATTEMPT WRONG: arg1: <36363434>, outError: Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)", returnVal: 0
//: 13 ATTEMPT WRONG: arg1: <33343634>, outError: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", returnVal: 0
//: 14 ATTEMPT WRONG: arg1: <33343637>, outError: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", returnVal: 0
//: 15 ATTEMPT WRONG: arg1: <31373336>, outError: Error Domain=com.apple.springboardfoundation.mkb Code=-14 "(null)", returnVal: 0
//:??? 16 CORRECT PASS: arg1: <32353830>, outError: (null), returnVal: 1
//:??? 17 CORRECT PASS: arg1: <32353830>, outError: (null), returnVal: 1
-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2 {
	BOOL val = %orig;
	NSLog(@"_authenticateWithPasscodeData called with -> arg1: %@, outError: %@, returnVal: %d", arg1, *arg2, val);
	/*
	NSLog(@"_authenticateWithPasscodeData!");
	NSLog(@"arg1 is %@", arg1);
	NSLog(@"arg1 belongs to %@", [arg1 class]);

	NSString* myString;
	myString = [[NSString alloc] initWithData:arg1 encoding:NSUTF8StringEncoding];
	NSLog(@"arg1 in string is: %@", myString);

	NSData* data = [myString dataUsingEncoding:NSUTF8StringEncoding];
	NSLog(@"converting arg1 back is: %@", data);
	
	// id val = *arg2;
	// NSLog(@"arg2 belongs to %@", [val class]);
	BOOL val = %orig;
	NSLog(@"thE return VALUE IS %d", val);
	
	NSLog(@"arg2 is %@", *arg2);
	NSLog(@"arg2 belongs to %@", [*arg2 class]);
	*/
	//: arg2 =  Error Domain=com.apple.springboardfoundation.mkb Code=-3 "(null)"
	//: *arg2 belongs to NSError
	//return val;
	//: MODIFIED
	return %orig(arg1, NULL);
}
//: Gets called at startup after (_isTemporarilyBlocked) is called with a return val of 0.
//: Gets called after "applicationDidFinishLaunching" (isAuthenticated) returns  NO.
-(void)_setup_runLoopObserverIfNecessary{
	//%log;
	NSLog(@"_setup_runLoopObserverIfNecessary");
	%orig;
}
//: AFTER CORRECT 16 PASS, THIS IS CALLED AFTER (_setAuthState)
-(void)_invalidateCachedPasscodeLockState {
	//%log;
	NSLog(@"_invalidateCachedPasscodeLockState");
	%orig;
}
//: THIS IS CALLED AFTER CORRECT 16 PASS
-(void)_updateSecureModeIfNecessaryForNewAuthState {
	//%log;
	NSLog(@"_updateSecureModeIfNecessaryForNewAuthState");
	%orig;
}
//arg1 is 1 or true when bootup
-(void)_setOkToSendNotifications:(BOOL)arg1  {
	//%log;
	NSLog(@"_setOkToSendNotifications, arg1: %d", arg1);
	%orig;
}
//: i do have passcode, starting value of arg1: 2
//: AFTER 17 CORRECT PASS, ARG1: 0
-(void)_updateHasPasscodeSetForLockState:(long long)arg1 {
	//%log;
	NSLog(@"_updateHasPasscodeSetForLockState, arg1: %lld", arg1);
	%orig;
}
//: At startup the return val is YES
-(BOOL)_shouldRevokeAuthenticationNow{
	BOOL val = %orig;
	NSLog(@"_shouldRevokeAuthenticationNow %d", val);
	return val;
}
//: yum this is called when timer is up and user can enter next input'
//: CALLED AFTER 13TH ATTEMPT: Gets called exactly at the time (deviceLockStateMayHaveChangedForModel) stated.
//: CALLED AFTER 14TH ATTEMPT: Gets called exactly at the time (deviceLockStateMayHaveChangedForModel) stated.
-(void)_unblockTimerFired {
	//%log;
	NSLog(@"_unblockTimerFired");
	%orig;
}
//: CALLED AFTER 17 CORRECT ATTEMPT: arg1: <SBFMobileKeyBagState: 0x170204ab0; lockState: Unlocked; isEffectivelyLocked: NO; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(void)_updateAuthenticationStateAndDateForLockState:(id)arg1 {
	//%log;
	NSLog(@"_updateAuthenticationStateAndDateForLockState, arg1: %@", arg1);
	%orig;
}
//:  NOT SURE WHEN CALLED
-(void)deviceLockModelRequestsDeviceWipe:(id)arg1 {
	//%log;
	NSLog(@"deviceLockModelRequestsDeviceWipe, arg1: %@", arg1);
	%orig;
}

//: 7

//: AFTER 13 ATTEMPT: arg1: <SBFUserAuthenticationModelSEP: 0x174251280; unblockTime: 2018-08-13 18:16:32 +0000; permanentlyBlocked: NO; pendingWipe: NO>
//: NOTE that the unblockTime is one minute ahead after it was printed!!!
//: AFTER 14 ATTEMPT: arg1: <SBFUserAuthenticationModelSEP: 0x174251280; unblockTime: 2018-08-13 18:48:53 +0000; permanentlyBlocked: NO; pendingWipe: NO>
//: NOTE that the unblockTime is 5 minute ahead after it was printed!!!
//: AFTER 15 ATTEMPT: arg1: <SBFUserAuthenticationModelSEP: 0x174251280; unblockTime: 2018-08-13 19:24:49 +0000; permanentlyBlocked: NO; pendingWipe: NO>
//: NOTE that the unblocTime is minutes ahead of the print statemetn
//: ?? AFTER 16 CORRECT ATTEMPT: arg1: <SBFUserAuthenticationModelSEP: 0x174455fc0; unblockTime: 0000-12-30 00:00:00 +0000; permanentlyBlocked: NO; pendingWipe: NO>
//: NOTE THE unblockTime has been reset!!!
//: ?? AFTER 17 CORRECT ATTEMPT: arg1: <SBFUserAuthenticationModelSEP: 0x174455fc0; unblockTime: 0000-12-30 00:00:00 +0000; permanentlyBlocked: NO; pendingWipe: NO>
-(void)deviceLockStateMayHaveChangedForModel:(id)arg1 {
	%orig(defaultVal);
	//%log;
	NSLog(@"deviceLockStateMayHaveChangedForModel, arg1: %@", arg1);
	//NSLog(@"arg1 comes from,%@ ", [arg1 class]);

	//: arg1 comes from SBFUserAuthenticationModelSEP
	%orig;
}
//: Does what it says, at startup returns a value YES
//: There is a pattern, (hasAuthenticatedAtLeastOnceSinceBoot), (_isUserAuthenticated) and finally (isAuthenticated)
-(BOOL)hasAuthenticatedAtLeastOnceSinceBoot {
	BOOL val = %orig;
	//%log;
	NSLog(@"hasAuthenticatedAtLeastOnceSinceBoot, returnVal: %d", val);
	return val;
}
//: At startup the return val is 0.
//: Returns 0 at the 13th attempt, but before this is called (_isTemporarilyBlocked) returns YES
//: Returns 0 at the 14th attempt
//: AFTER CORRECT 16 PASS, THE RETURN VAL IS 1
//: AFTER CORRECT 17 PASS, THE RETURN VAL IS 1
-(BOOL)isAuthenticatedCached {
	BOOL val = %orig;
	//%log;
	NSLog(@"isAuthenticatedCached, returnVal: %d", val);
	return val;
}
//: Startup val for arg1: StartupTransitionToLockOut
-(void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	NSLog(@"revokeAuthenticationImmediatelyIfNecessaryForPublicReason, arg1: %@", arg1);
	%orig;
}
//: Called after "applicationDidFinishLaunching", arg1: Lock button
//: UPDATE: This gets called after lockscreen locks
-(void)revokeAuthenticationIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	NSLog(@"revokeAuthenticationIfNecessaryForPublicReason, arg1: %@", arg1);
	%orig;
}
//: Gets called after "applicationDidFinishLaunching", arg1: <SBFAuthenticationRequest: 0x171449b10; type: 1; source: 0; handler: <__NSMallocBlock__: 0x170e7e040>> & arg2: (null)
//: UPDATE: This gets called when in the keypad view AND TYPING
-(void)processAuthenticationRequest:(id)arg1 responder:(id)arg2 {
	//%log;
	NSLog(@"processAuthenticationRequest, arg1: %@, arg2: %@", arg1, arg2);
	%orig;
}
//: GETS CALLED AFTER 16 CORRECT PASS: arg1: <SBFAuthenticationRequest: 0x175a43f30; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17427c8c0>>
-(void)processAuthenticationRequest:(id)arg1 {
	//%log;
	NSLog(@"processAuthenticationRequest, arg1: %@", arg1);
	%orig;
}
//: Called at startup, arg1:  <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
//: AFTER 16 CORRECT ATTEMPT: arg1: <SBFAuthenticationAssertion: 0x171a4e940; reason: DashBoardSustainUnlock; type: SustainAuthentication; valid: NO>
//: AGAIN, AFTER 16 CORRECT ATTEMPT, arg1: <SBFAuthenticationAssertion: 0x174e43390; reason: UI unlock attempt; type: SustainGracePeriod; valid: NO>
//: AFTER 17 CORRECT ATTTEMPT: <SBFAuthenticationAssertion: 0x170e50a70; reason: UI unlocked; type: SustainAuthentication; valid: NO>

-(void)addAuthenticationAssertion:(id)arg1 {
	//%log;
	NSLog(@"addAuthenticationAssertion, arg1: %@", arg1);
	%orig;
}
//: Called after "applicationDidFinishLaunching" <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
//: CALLED AFTER 17 CORRECT PASS: arg1: <SBFAuthenticationAssertion: 0x174e43390; reason: UI unlock attempt; type: SustainGracePeriod; valid: NO>
-(void)removeAuthenticationAssertion:(id)arg1 {
	//%log;
	NSLog(@"removeAuthenticationAssertion, arg1: %@", arg1);
	%orig;
}
//:  NOT SURE WHEN CALLED
-(double)_timeUntilUnblockedSinceReferenceDate{
	double val = %orig;
	//%log;
	NSLog(@"_timeUntilUnblockedSinceReferenceDate, returnVal: %f", val);
	return val;
}
//: at startup arg1 is: <SBFDeviceLockOutController: 0x170235560; lockedOut: YES; thermalProvider: <SBThermalController: 0x1702dd1f0; ThermalLevel: None;
//: Also at startup arg1 is: <SBLockScreenManager: 0x170153400; UI Locked: NO; Allows DisablePasscodeLockAssertion: NO; Allow Locking/Unlocking: NO>
-(void)_addPrivateAuthenticationObserver:(id)arg1 {
	NSLog(@"_addPrivateAuthenticationObserver, arg1: %@", arg1);
	%orig;
}
//: Prints when the last valid password entered was
-(NSDate *)lastRevokedAuthenticationDate {
	NSDate *val = %orig;
	NSLog(@"lastRevokedAuthenticationDate, value  %@", val);
	return val;
}
//: At startup arg1: YES
-(void)setHasPasscodeSet:(BOOL)arg1  {
	NSLog(@"setHasPasscodeSet, arg1: %d", arg1);
	%orig;
}
//:  NOT SURE WHEN CALLED
-(id)_unblockTimer {
	id val = %orig;
	NSLog(@"_unblockTimer, returnVal: %@", val);
	return val;
}
//:  NOT SURE WHEN CALLED
-(void)_setUnblockTimer:(id)arg1  {
	NSLog(@"_setUnblockTimer, arg1 %@", arg1);
	%orig;
}
//: At startup this returns a NO.
//: AT 16 CORRECT PASS, THIS RETURNS A YES
//: AT 17 CORRECT PASS, THIS RETURNS A YES
-(BOOL)isAuthenticated {
	BOOL val = %orig;
	NSLog(@"isAuthenticated, returnVal: %d", val);
	return val;
}

//: Called at startup: arg1 <SBFUserAuthenticationModelSEP: 0x170648370; unblockTime: 0000-12-30 00:00:00 +0000; permanentlyBlocked: NO; pendingWipe: NO>
-(void)_setModel:(id)arg1 {
	//: arg1 is a SBUserAuthenticationModelSEP that contains an unblockTime, permantlyBlocked, pendingWipe
	NSLog(@"_setModel, arg1 %@", arg1);

	if (!hasBeenCalledBefore) {
		defaultVal = arg1;
		hasBeenCalledBefore = YES;
		NSLog(@"I should only be called once...............");
	}

	%orig;
}
//: Start up val is of:  <SBFUserAuthenticationController: 0x1742f5000; authState: Revoked; passcodeSet: YES> 
-(id)descriptionWithMultilinePrefix:(id)arg1 {
	id val = %orig;
	NSLog(@"descriptionWithMultilinePrefix, returnVal: %@", val);
	return val;
}
//: Start up val is of type: <BSDescriptionBuilder: 0x17486b440>
-(id)succinctDescriptionBuilder {
	id val = %orig;
	NSLog(@"succinctDescriptionBuilder, returnVal: %@", val);
	return val;
}
//: Start up val is of: <BSDescriptionBuilder: 0x17486b440>
-(id)descriptionBuilderWithMultilinePrefix:(id)arg1 {
	id val = %orig;
	NSLog(@"descriptionBuilderWithMultilinePrefix, returnVal: %@", val);
	return val;
}

%end

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 {
	%orig;
	NSLog(@"applicationDidFinishLaunching--------------------------------------------------------");
}
%end