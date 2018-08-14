//: forward declaring classes
@class SBFMobileKeyBagState;
@class PCPersistentTimer;

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
-(BOOL)hasPasscodeSet;
-(void)createStashBag:(id)arg1 completion:(/*^block*/id)arg2 ;
-(BOOL)hasBeenUnlockedSinceBoot;
-(SBFMobileKeyBagState *)extendedState;
-(BOOL)beginRecovery:(id)arg1 error:(id*)arg2 ;
-(void)waitForUnlockWithTimeout:(float)arg1 ;
@end

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
	MSHookIvar<double>(self, "_unblockTime") = -1.0;

	double val = %orig;
	HBLogDebug(@"timeUntilUnblockedSinceReferenceDate: %f \n", val);

	return -1.0;

}
-(BOOL)isPermanentlyBlocked {
	return NO;
}

//: 6
-(void)notePasscodeUnlockFailedWithError:(id)arg1 {
	//: MOVED from timeUntilUnblockedSinceReferenceDate to here.
	double time = MSHookIvar<double>(self, "_unblockTime");
	HBLogDebug(@"_unblockTime, %f \n", time);
	MSHookIvar<double>(self, "_unblockTime") = -1.0;

	HBLogDebug(@"notePasscodeUnlockFailedWithError, %@ \n", arg1);
	//HBLogDebug(@"arg2 belongs to %@", [arg1 class]);

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
	HBLogDebug(@"_isInBioUnlockState %d", val);
	return val;
}

//: Start up val returns: < SBFUserAuthenticationController: 0x1744e1580; authState: Revoked; passcodeSet: YES>
-(NSString *)description {
	NSString *val = %orig;
	HBLogDebug(@"description %@", val);
	return val;
}

//: Start up val: <SBFUserAuthenticationController: 0x1742f5000; authState: Revoked; hasPasscodeSet: YES; revokedAuthDate: 2018-08-13 11:39:57 -0400; model: ...
//: Prints out SBFUserAuthenticationController: 0x1744e1580; authState: Revoked; hasPasscodeSet: YES; revokedAuthDate: 2018-08-12 16:59:23 -0400
//: This keeps track of our last successful password date and time.
-(id)publicDescription {
	id val = %orig;
	HBLogDebug(@"publicDescription, return val: %@", val);
	return val;
}
//: CALLED AFTER 16 CORRECT ATTEMPT, arg1: <SBFMobileKeyBag: 0x17446eac0> (arg2) value: <SBFMobileKeyBagState: 0x170204ab0; lockState: Unlocked; isEffectivelyLocked: NO; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(void)keybag:(id)arg1 extendedStateDidChange:(id)arg2 {
	id val = arg1;
	id val2 = arg2;
	HBLogDebug(@"keybag called, arg1: %@ (arg2) value: %@", val, val2);
	%orig;
}
//: Tells us whether there is a passcode set 
-(BOOL)hasPasscodeSet {
	BOOL val = %orig;
	HBLogDebug(@"hasPasscodeSet %d", val);
	return val;
}
//: start up for arg1 returns :  <SBFAuthenticationAssertionManager: 0x17422bd00> 
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2 keybag:(id)arg3 model:(id)arg4 {
	id val = arg1; 
	id val2 = arg2; 
	id val3 = arg3; 
	id val4 = arg4; 
	id finalValue = %orig;
	HBLogDebug(@"initWithAssertionManager, arg values: %@ %@ %@ %@ return val: %@", val, val2, val3, val4, finalValue);
	return %orig;
}
//: The starting value is 2
-(void)_initializeAuthenticationStateAndDateForLockState:(long long)arg1 {
	long long val = arg1;
	HBLogDebug(@"_initializeAuthenticationStateAndDateForLockState %lld", val); 
	%orig;
}

//: Starting value of arg1 is 2
-(void)_establishAuthenticationStateForInit:(long long)arg1 {
	long long val = arg1;
	HBLogDebug(@"_establishAuthenticationStateForInit, arg1: %lld", val);
	//%log;
	%orig;
}
//: arg1 is of type SBDefaultAuthenticationPolicy
-(void)_setupPolicy:(id)arg1 {
	id val = arg1;
	HBLogDebug(@"_setupPolicy arg1: %@", val);
	%orig;
}
//: Start up val for arg1 is YES
-(void)_setHasBeenAuthenticatedOnceSinceBoot:(BOOL)arg1 {
	BOOL val = arg1;
	HBLogDebug(@"_setHasBeenAuthenticatedOnceSinceBoot, arg1: %d", val);
	%orig;
}
//: THis is called at startup
-(void)_clearUnblockTimer {
	HBLogDebug(@"_clearUnblockTimer");
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
	HBLogDebug(@"_processAuthenticationRequest, arg1: %@, responder %@", arg1, arg2);
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
	HBLogDebug(@"_evaluateAuthenticationAttempt, arg1: %@ arg2: %@", arg1, *arg2);
	//HBLogDebug(@"arg2 is %@", *arg2);
	//HBLogDebug(@"arg2 belongs to %@", [*arg2 class]);
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
	HBLogDebug(@"_notifyClientsOfAuthenticationResult, arg1: %lld, arg2: %@, arg3: %@, responder: %@", arg1, arg2, arg3, arg4);
	//HBLogDebug(@"arg3 is %@", arg3);
	//HBLogDebug(@"arg3 belongs to %@", [arg3 class]);
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
	HBLogDebug(@"_boolForAuthenticationResult arg1: %lld, return val: %d", arg1, val);
	//%log;
	return val;
}
//: called when pass is correct
//: CALLED ON THE 16 CORRECT ATTEMPT, arg1: <SBFAuthenticationRequest: 0x174447140; type: 1; source: 0; handler: <__NSMallocBlock__: 0x174869b40>>, responder: (null)
//: CALLED ON THE 17 CORRECT ATTEMPT, arg1: <SBFAuthenticationRequest: 0x175a43f30; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17427c8c0>>, responder: (null)
-(void)_handleSuccessfulAuthentication:(id)arg1 responder:(id)arg2  {
	HBLogDebug(@"_handleSuccessfulAuthentication, arg1: %@, responder: %@", arg1, arg2);
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
	HBLogDebug(@"_handleFailedAuthentication, arg1: %@, arg2: %@, responder: %@", arg1, arg2, arg3);
	//HBLogDebug(@"arg2 is %@", arg2);
	//HBLogDebug(@"arg2 belongs to %@", [arg2 class]);
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
	HBLogDebug(@"_handleInvalidAuthentication, arg1: %@, responder: %@", arg1, arg2);
	//%log;
	%orig;
}
//: This is called at startup
//: This triggers the timer 
//: The order for startup is : (_scheduleUnblockTimer) then (_clearUnblockTimer) and finally (_refreshModelCacheIfNeeded)
//: UPDATE: this is called after (_handleFailedAuthentication)
-(void)_scheduleUnblockTimer {
	HBLogDebug(@"_scheduleUnblockTimer");
	//%log;
	//%orig;
	//[self _unblockTimerFired];
	%orig;
}
//: AFTER THE 16 CORRECT PASS, ARG1: 1
//: AFTER THE 17 CORRECT PASS, ARG1: 1
-(void)_setAuthState:(long long)arg1  {
	HBLogDebug(@"_setAuthState, arg1 %lld", arg1);
	//%log;
	%orig;
}
//: At startup arg1: YES & arg2: StartupTransitionToLockOut
//: After (_updateAuthenticationStateForPublicReason) called, arg1: NO & arg2: remove authentication assertion: <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
//: After (revokeAuthenticationIfNecessaryForPublicReason) called, arg1: NO, arg 2: Lock button

//: UPDATE, after (revokeAuthenticationIfNecessaryForPublicReason) gets called because of lock screen going away, this func gets called.
//: GETS CALLED AFTER 17 CORRECT PASS: arg1 0, reason: authentication successful from authentication request
-(void)_updateAuthenticationStateImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	HBLogDebug(@"_updateAuthenticationStateImmediately, arg1 %d, reason: %@", arg1, arg2);
	%orig;
}

//: Called when user uses finger as passcode
-(BOOL)_performNilPasscodeCheck{
	BOOL val = %orig;
	HBLogDebug(@"_performNilPasscodeCheck return val: %d", val);
	return val;
}

//: arg1 is 1 and arg2 is 0 at startup
//: arg1 is 1 or YES when locked and 0 OR NO when unlocked
//: AFTER CORRECT 16 PASS, ARG1: NO and and arg2 is YES
-(void)_setSecureMode:(BOOL)arg1 postNotification:(BOOL)arg2 {
	HBLogDebug(@"_setSecureMode, arg1: %d, notification: %d", arg1, arg2);
	//%log;
	%orig;
}

//: At startup this returns a NO.
//: ON THE CORRECT 16 PASS, THIS RETURNS A YES
-(BOOL)_isUserAuthenticated{
	BOOL val = %orig;
	HBLogDebug(@"_isUserAuthenticated %d", val);
	return val;
}
//arg1: 0, reason remove authentication assertion: <SBFAuthenticationAssertion: 0x170e45b80; reason: UI unlocked; type: SustainAuthentication; valid: NO>
-(void)_revokeAuthenticationImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	BOOL val = arg1;
	HBLogDebug(@"_revokeAuthenticationImmediately, arg1: %d, reason %@", val, arg2);
	%orig;
}

//: Called after removeAuthenticationAssertion(), arg1 is remove authentication assertion: <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
-(void)_updateAuthenticationStateForPublicReason:(id)arg1 {
	HBLogDebug(@"_updateAuthenticationStateForPublicReason, arg1: %@", arg1);
	//%log;
	 %orig;
}

//: Gets called whenever user taps a number
-(void)notePasscodeEntryBegan {
	//HBLogDebug(@"notePasscodeEntryBegan");
	//%log;
	 %orig;
}
//: Gets called when user deletes all numbers tapped
-(void)notePasscodeEntryCancelled {
	//HBLogDebug(@"notePasscodeEntryCancelled");
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
	HBLogDebug(@"_notifyAboutTemporaryBlockStatusChanged");
	//%log;
	 %orig;
}
//: The startup return val is NO.
//: AFTER 13TH ATTEMPT WRONG:  return val YES! (This is called after (_refreshModelCacheIfNeeded))
-(BOOL)_isTemporarilyBlocked {
	BOOL val = %orig;
	HBLogDebug(@"_isTemporarilyBlocked, return val %d", val);
	return NO;
}
//: The startup return val is NO.
//: AFTER 13 ATTEMPT: return val YES! (This is called after (_refreshModelCacheIfNeeded))
-(BOOL)_isPermanentlyBlocked {
	 BOOL val = %orig;
	HBLogDebug(@"_isPermanentlyBlocked, return val %d", val);
	return NO;
}
//: This is called at startup
-(void)_refreshModelCacheIfNeeded{
	HBLogDebug(@"_refreshModelCacheIfNeeded");
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
	HBLogDebug(@"_evaluatePasscodeAttempt, arg1: %@, error: %@, returnVal: val: %lld", arg1, *arg2, val);
	//HBLogDebug(@"arg2 is %@", *arg2);
	//HBLogDebug(@"arg2 belongs to %@", [*arg2 class]);
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
	HBLogDebug(@"_authenticateWithPasscodeData called with -> arg1: %@, outError: %@, returnVal: %d", arg1, *arg2, val);
	/*
	HBLogDebug(@"_authenticateWithPasscodeData!");
	HBLogDebug(@"arg1 is %@", arg1);
	HBLogDebug(@"arg1 belongs to %@", [arg1 class]);

	NSString* myString;
	myString = [[NSString alloc] initWithData:arg1 encoding:NSUTF8StringEncoding];
	HBLogDebug(@"arg1 in string is: %@", myString);

	NSData* data = [myString dataUsingEncoding:NSUTF8StringEncoding];
	HBLogDebug(@"converting arg1 back is: %@", data);
	
	// id val = *arg2;
	// HBLogDebug(@"arg2 belongs to %@", [val class]);
	BOOL val = %orig;
	HBLogDebug(@"thE return VALUE IS %d", val);
	
	HBLogDebug(@"arg2 is %@", *arg2);
	HBLogDebug(@"arg2 belongs to %@", [*arg2 class]);
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
	HBLogDebug(@"_setup_runLoopObserverIfNecessary");
	%orig;
}
//: AFTER CORRECT 16 PASS, THIS IS CALLED AFTER (_setAuthState)
-(void)_invalidateCachedPasscodeLockState {
	//%log;
	HBLogDebug(@"_invalidateCachedPasscodeLockState");
	%orig;
}
//: THIS IS CALLED AFTER CORRECT 16 PASS
-(void)_updateSecureModeIfNecessaryForNewAuthState {
	//%log;
	HBLogDebug(@"_updateSecureModeIfNecessaryForNewAuthState");
	%orig;
}
//arg1 is 1 or true when bootup
-(void)_setOkToSendNotifications:(BOOL)arg1  {
	//%log;
	HBLogDebug(@"_setOkToSendNotifications, arg1: %d", arg1);
	%orig;
}
//: i do have passcode, starting value of arg1: 2
//: AFTER 17 CORRECT PASS, ARG1: 0
-(void)_updateHasPasscodeSetForLockState:(long long)arg1 {
	//%log;
	HBLogDebug(@"_updateHasPasscodeSetForLockState, arg1: %lld", arg1);
	%orig;
}
//: At startup the return val is YES
-(BOOL)_shouldRevokeAuthenticationNow{
	BOOL val = %orig;
	HBLogDebug(@"_shouldRevokeAuthenticationNow %d", val);
	return val;
}
//: yum this is called when timer is up and user can enter next input'
//: CALLED AFTER 13TH ATTEMPT: Gets called exactly at the time (deviceLockStateMayHaveChangedForModel) stated.
//: CALLED AFTER 14TH ATTEMPT: Gets called exactly at the time (deviceLockStateMayHaveChangedForModel) stated.
-(void)_unblockTimerFired {
	//%log;
	HBLogDebug(@"_unblockTimerFired");
	%orig;
}
//: CALLED AFTER 17 CORRECT ATTEMPT: arg1: <SBFMobileKeyBagState: 0x170204ab0; lockState: Unlocked; isEffectivelyLocked: NO; permanentlyBlocked: NO; shouldWipe: NO; recoveryRequired: NO; recoveryPossible: YES; backOffTime: 0; failedAttemptCount: 0; escrowCount: 0>
-(void)_updateAuthenticationStateAndDateForLockState:(id)arg1 {
	//%log;
	HBLogDebug(@"_updateAuthenticationStateAndDateForLockState, arg1: %@", arg1);
	%orig;
}
//:  NOT SURE WHEN CALLED
-(void)deviceLockModelRequestsDeviceWipe:(id)arg1 {
	//%log;
	HBLogDebug(@"deviceLockModelRequestsDeviceWipe, arg1: %@", arg1);
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
	HBLogDebug(@"deviceLockStateMayHaveChangedForModel, arg1: %@", arg1);
	//HBLogDebug(@"arg1 comes from,%@ ", [arg1 class]);

	//: arg1 comes from SBFUserAuthenticationModelSEP
	%orig;
}
//: Does what it says, at startup returns a value YES
//: There is a pattern, (hasAuthenticatedAtLeastOnceSinceBoot), (_isUserAuthenticated) and finally (isAuthenticated)
-(BOOL)hasAuthenticatedAtLeastOnceSinceBoot {
	BOOL val = %orig;
	//%log;
	HBLogDebug(@"hasAuthenticatedAtLeastOnceSinceBoot, returnVal: %d", val);
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
	HBLogDebug(@"isAuthenticatedCached, returnVal: %d", val);
	return val;
}
//: Startup val for arg1: StartupTransitionToLockOut
-(void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	HBLogDebug(@"revokeAuthenticationImmediatelyIfNecessaryForPublicReason, arg1: %@", arg1);
	%orig;
}
//: Called after "applicationDidFinishLaunching", arg1: Lock button
//: UPDATE: This gets called after lockscreen locks
-(void)revokeAuthenticationIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	HBLogDebug(@"revokeAuthenticationIfNecessaryForPublicReason, arg1: %@", arg1);
	%orig;
}
//: Gets called after "applicationDidFinishLaunching", arg1: <SBFAuthenticationRequest: 0x171449b10; type: 1; source: 0; handler: <__NSMallocBlock__: 0x170e7e040>> & arg2: (null)
//: UPDATE: This gets called when in the keypad view AND TYPING
-(void)processAuthenticationRequest:(id)arg1 responder:(id)arg2 {
	//%log;
	HBLogDebug(@"processAuthenticationRequest, arg1: %@, arg2: %@", arg1, arg2);
	%orig;
}
//: GETS CALLED AFTER 16 CORRECT PASS: arg1: <SBFAuthenticationRequest: 0x175a43f30; type: 1; source: 0; handler: <__NSMallocBlock__: 0x17427c8c0>>
-(void)processAuthenticationRequest:(id)arg1 {
	//%log;
	HBLogDebug(@"processAuthenticationRequest, arg1: %@", arg1);
	%orig;
}
//: Called at startup, arg1:  <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
//: AFTER 16 CORRECT ATTEMPT: arg1: <SBFAuthenticationAssertion: 0x171a4e940; reason: DashBoardSustainUnlock; type: SustainAuthentication; valid: NO>
//: AGAIN, AFTER 16 CORRECT ATTEMPT, arg1: <SBFAuthenticationAssertion: 0x174e43390; reason: UI unlock attempt; type: SustainGracePeriod; valid: NO>
//: AFTER 17 CORRECT ATTTEMPT: <SBFAuthenticationAssertion: 0x170e50a70; reason: UI unlocked; type: SustainAuthentication; valid: NO>

-(void)addAuthenticationAssertion:(id)arg1 {
	//%log;
	HBLogDebug(@"addAuthenticationAssertion, arg1: %@", arg1);
	%orig;
}
//: Called after "applicationDidFinishLaunching" <SBFAuthenticationAssertion: 0x170e4b5e0; reason: DashBoardAttemptUnlock; type: SustainGracePeriod; valid: NO>
//: CALLED AFTER 17 CORRECT PASS: arg1: <SBFAuthenticationAssertion: 0x174e43390; reason: UI unlock attempt; type: SustainGracePeriod; valid: NO>
-(void)removeAuthenticationAssertion:(id)arg1 {
	//%log;
	HBLogDebug(@"removeAuthenticationAssertion, arg1: %@", arg1);
	%orig;
}
//:  NOT SURE WHEN CALLED
-(double)_timeUntilUnblockedSinceReferenceDate{
	double val = %orig;
	//%log;
	HBLogDebug(@"_timeUntilUnblockedSinceReferenceDate, returnVal: %f", val);
	return val;
}
//: at startup arg1 is: <SBFDeviceLockOutController: 0x170235560; lockedOut: YES; thermalProvider: <SBThermalController: 0x1702dd1f0; ThermalLevel: None;
//: Also at startup arg1 is: <SBLockScreenManager: 0x170153400; UI Locked: NO; Allows DisablePasscodeLockAssertion: NO; Allow Locking/Unlocking: NO>
-(void)_addPrivateAuthenticationObserver:(id)arg1 {
	HBLogDebug(@"_addPrivateAuthenticationObserver, arg1: %@", arg1);
	%orig;
}
//: Prints when the last valid password entered was
-(NSDate *)lastRevokedAuthenticationDate {
	NSDate *val = %orig;
	HBLogDebug(@"lastRevokedAuthenticationDate, value  %@", val);
	return val;
}
//: At startup arg1: YES
-(void)setHasPasscodeSet:(BOOL)arg1  {
	HBLogDebug(@"setHasPasscodeSet, arg1: %d", arg1);
	%orig;
}
//:  NOT SURE WHEN CALLED
-(id)_unblockTimer {
	id val = %orig;
	HBLogDebug(@"_unblockTimer, returnVal: %@", val);
	return val;
}
//:  NOT SURE WHEN CALLED
-(void)_setUnblockTimer:(id)arg1  {
	HBLogDebug(@"_setUnblockTimer, arg1 %@", arg1);
	%orig;
}
//: At startup this returns a NO.
//: AT 16 CORRECT PASS, THIS RETURNS A YES
//: AT 17 CORRECT PASS, THIS RETURNS A YES
-(BOOL)isAuthenticated {
	BOOL val = %orig;
	HBLogDebug(@"isAuthenticated, returnVal: %d", val);
	return val;
}

//: Called at startup: arg1 <SBFUserAuthenticationModelSEP: 0x170648370; unblockTime: 0000-12-30 00:00:00 +0000; permanentlyBlocked: NO; pendingWipe: NO>
-(void)_setModel:(id)arg1 {
	//: arg1 is a SBUserAuthenticationModelSEP that contains an unblockTime, permantlyBlocked, pendingWipe
	HBLogDebug(@"_setModel, arg1 %@", arg1);

	if (!hasBeenCalledBefore) {
		defaultVal = arg1;
		hasBeenCalledBefore = YES;
		HBLogDebug(@"I should only be called once...............");
	}

	%orig;
}
//: Start up val is of:  <SBFUserAuthenticationController: 0x1742f5000; authState: Revoked; passcodeSet: YES> 
-(id)descriptionWithMultilinePrefix:(id)arg1 {
	id val = %orig;
	HBLogDebug(@"descriptionWithMultilinePrefix, returnVal: %@", val);
	return val;
}
//: Start up val is of type: <BSDescriptionBuilder: 0x17486b440>
-(id)succinctDescriptionBuilder {
	id val = %orig;
	HBLogDebug(@"succinctDescriptionBuilder, returnVal: %@", val);
	return val;
}
//: Start up val is of: <BSDescriptionBuilder: 0x17486b440>
-(id)descriptionBuilderWithMultilinePrefix:(id)arg1 {
	id val = %orig;
	HBLogDebug(@"descriptionBuilderWithMultilinePrefix, returnVal: %@", val);
	return val;
}

%end

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 {
	%orig;
	HBLogDebug(@"applicationDidFinishLaunching");
}
%end